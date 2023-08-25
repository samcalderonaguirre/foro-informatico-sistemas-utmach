
from rest_framework import serializers
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth import authenticate
from rest_framework.validators import UniqueValidator
from django.contrib.humanize.templatetags.humanize import naturaltime
from accounts.models import UserProfile

from correo.models import Correo
from django.core.mail import EmailMessage

import random
ENVIO_CODIGO = False
CODIGO_ENVIADO = 0


class UserDetailSerializer(serializers.ModelSerializer):
    bio = serializers.CharField(source='profile.bio')
    avatar = serializers.URLField(source='profile.avatar')
    status = serializers.URLField(source='profile.status')
    name = serializers.CharField(source='profile.name')
    threads = serializers.HyperlinkedRelatedField(
        many=True,
        read_only=True,
        view_name='thread-detail',
        lookup_field='pk'
    )
    posts = serializers.HyperlinkedRelatedField(
        many=True,
        read_only=True,
        view_name='post-detail',
        lookup_field='pk'
    )
    date_joined = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = [
            'username',
            'name',
            'bio',
            'avatar',
            'status',
            'is_staff',
            'date_joined',
            'threads',
            'posts'
        ]
        lookup_field = 'username'

    def get_date_joined(self, obj):
        return naturaltime(obj.date_joined)


class UserListSerializer(serializers.ModelSerializer):
    bio = serializers.CharField(source='profile.bio')
    avatar = serializers.URLField(source='profile.avatar')
    status = serializers.URLField(source='profile.status')
    name = serializers.CharField(source='profile.name')

    class Meta:
        model = User
        fields = [
            'username',
            'name',
            'bio',
            'avatar',
            'status',
            'is_staff',
            'date_joined'
        ]


class UserUpdateSerializer(serializers.ModelSerializer):
    # A field from the user's profile:
    bio = serializers.CharField(source='profile.bio', allow_blank=True)
    name = serializers.CharField(
        source='profile.name',
        max_length=32,
        allow_blank=True
    )
    avatar = serializers.URLField(source='profile.avatar', allow_blank=True)
    status = serializers.CharField(
        source='profile.status',
        allow_blank=True,
        default='',
        min_length=0,
        max_length=16
    )
    current_password = serializers.CharField(
        write_only=True,
        allow_blank=True,
        label=_("Current Password"),
        help_text=_('Required'),
    )
    new_password = serializers.CharField(
        allow_blank=True,
        default='',
        write_only=True,
        min_length=4,
        max_length=32,
        label=_("New Password"),
    )
    email = serializers.EmailField(
        allow_blank=True,
        default='',
        validators=[UniqueValidator(
            queryset=User.objects.all(),
            message='Este correo ya ha sido tomado por otro usuario'
        )]
    )

    class Meta:
        model = User
        fields = (
            'username',
            'name',
            'email',
            'current_password',
            'new_password',
            'bio',
            'avatar',
            'status'
        )
        read_only_fields = ('username',)
        lookup_field = 'username'

    def update(self, instance, validated_data):
        try:
            username = self.context.get('request').user.username
        except:
            msg = _('Debe estar logueado')
            raise serializers.ValidationError(msg, code='authorization')

        password = validated_data.get('current_password')
        validated_data.pop('current_password', None)

        if not password:
            msg = _('Debe ingresar la contraseña actual')
            raise serializers.ValidationError(msg, code='authorization')

        user = authenticate(request=self.context.get('request'),
                            username=username, password=password)
        if not user:
            msg = _('Lo sentimos, la contraseña que ingresó es incorrecta')
            raise serializers.ValidationError(msg, code='authorization')

        # change password to a new one if it exists
        new_password = validated_data.get('new_password') or None
        if new_password:
            instance.set_password(new_password)
        validated_data.pop('new_password', None)

        # Update user profile fields
        profile_data = validated_data.pop('profile', None)
        profile = instance.profile
        for field, value in profile_data.items():
            if value:
                setattr(profile, field, value)
        # Update user fields
        for field, value in validated_data.items():
            if value:
                setattr(instance, field, value)

        profile.save()
        instance.save()
        return instance


class UserCreateSerializer(serializers.ModelSerializer):
    # A field from the user's profile:
    username = serializers.SlugField(
        min_length=4,
        max_length=32,
        help_text=_(
            'Requerido de 4 a 32 caracteres, Letras, Numeros y Carcateres.'
        ),
        validators=[UniqueValidator(
            queryset=User.objects.all(),
            message='Este nombre de usuario ya esta tomado'
        )],
        required=True
    )
    password = serializers.CharField(
        min_length=4,
        max_length=32,
        write_only=True,
        help_text=_(
            'Requerido de 4 a 32 caracteres'
        ),
        required=True
    )
    email = serializers.EmailField(
        required=True,
        validators=[UniqueValidator(
            queryset=User.objects.all(),
            message='El correo ya está tomado'
        )]
    )
    bio = serializers.CharField(
        source='profile.bio', allow_blank=True, default='')
    name = serializers.CharField(
        source='profile.name',
        allow_blank=True,
        default='',
        max_length=32
    )
    avatar = serializers.URLField(
        source='profile.avatar', allow_blank=True, default='')
    status = serializers.CharField(
        source='profile.status',
        allow_blank=True,
        max_length=16,
        min_length=0,
        default=''
    )

    class Meta:
        model = User
        fields = (
            'username',
            'name',
            'email',
            'password',
            'bio',
            'avatar',
            'status'
        )

    def create(self, validated_data):
        profile_data = validated_data.pop('profile', None)
        username = validated_data['username']
        email = validated_data['email']
        password = validated_data['password']

        try:
            correo_bd=Correo.objects.get(correo=email)
            print(correo_bd)
        except Exception as ex:
            print(ex)
            msg = _('Lo sentimos, El correo no es de un estudiante de UTMACH')
            raise serializers.ValidationError(msg, code='authorization')
        # Si es de la UTMACH, ENVIAR MENSAJE
        global CODIGO_ENVIADO
        global ENVIO_CODIGO
        if ENVIO_CODIGO == False:  # Si aun no se ha enviado el codigo
            CODIGO_ENVIADO = random.randint(1000, 9999)
            asunto = "CÓDIGO DE VERIFICACIÓN FORO INFORMÁTICO"
            mensaje = f"Gracias por usar nuestro servicio, su codigo de verificación es {CODIGO_ENVIADO}"
            mail = EmailMessage(asunto, mensaje, to=[email])
            mail.send()
            ENVIO_CODIGO = True
            msg = _(f'Hemos enviado un código a tu correo institucional, ingrésalo')
            raise serializers.ValidationError(msg, code='authorization')

        else:  # Si es usuario de la U y el codigo ya se envio
            name = ''
            codigo_obtenido = ''
            try:
                usuario_codigo = profile_data.get('name', '').split('$')
                name = usuario_codigo[0]
                codigo_obtenido = usuario_codigo[1]
                print(
                    f' codigo enviado {CODIGO_ENVIADO} codigo obtenido {codigo_obtenido}')
                if int(codigo_obtenido) != CODIGO_ENVIADO:
                    msg = _(f'Código Incorrecto.Ingresa de nuevo')
                    raise serializers.ValidationError(
                        msg, code='authorization')
            except ValueError:  # Significa que no esta llegando el codigo de verificacion
                CODIGO_ENVIADO = random.randint(1000, 9999)
                asunto = "CÓDIGO DE VERIFICACIÓN FORO INFORMÁTICO"
                mensaje = f"Gracias por usar nuestro servicio, su codigo de verificación es {CODIGO_ENVIADO}"
                mail = EmailMessage(asunto, mensaje, to=[email])
                mail.send()
                ENVIO_CODIGO = True
                msg = _(
                    f'Hemos enviado un código a tu correo institucional, ingrésalo')
                raise serializers.ValidationError(msg, code='authorization')

            user = User(
                username=username,
                email=email
            )
            user.set_password(password)
            user.save()
            avatar = profile_data.get('avatar') or None
            if not avatar:
                avatar = 'https://res.cloudinary.com/rengorum/image/upload/v1581003654/zbogea0xxt8zeha2obdw.png'
            profile = UserProfile(
                user=user,
                bio=profile_data.get('bio', ''),
                avatar=avatar,
                name=name,  # profile_data.get('name', ''),
                status=profile_data.get('status', 'Member')
            )
            profile.save()
            ENVIO_CODIGO = False
            CODIGO_ENVIADO = 0
            return user


class UserTokenSerializer(serializers.Serializer):
    username = serializers.CharField(label=_("Username"))
    password = serializers.CharField(
        label=_("Password"),
        style={'input_type': 'password'},
        trim_whitespace=False
    )

    def validate(self, attrs):
        username = attrs.get('username')
        password = attrs.get('password')

        if username and password:
            user = authenticate(request=self.context.get('request'),
                                username=username, password=password)
            if not user:
                msg = _(
                    'No se puede iniciar sesión con las credenciales proporcionadas.')
                raise serializers.ValidationError(msg, code='authorization')
        else:
            msg = _('Debe incluir "nombre de usuario" y "contraseña".')
            raise serializers.ValidationError(msg, code='authorization')

        attrs['user'] = user
        return attrs


class UserLoginSerializer(serializers.ModelSerializer):
    username = serializers.SlugField(
        max_length=32,
        help_text=_(
            'Necesario. 32 caracteres o menos. Solo letras, números, guiones bajos o guiones.'
        ),
        required=True
    )
    token = serializers.CharField(allow_blank=True, read_only=True)
    name = serializers.CharField(source='profile.name', read_only=True)

    class Meta:
        model = User
        fields = [
            'username',
            'name',
            'password',
            'token',
        ]
        extra_kwargs = {"password": {"write_only": True}}
