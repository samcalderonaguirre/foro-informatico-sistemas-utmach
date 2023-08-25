from rest_framework import serializers
from django.utils.translation import ugettext_lazy as _
from django.utils.timezone import now
from django.contrib.auth.models import User
from posts.models import Post
from threads.models import Thread
#Esta importacion es para ver la materia
from forums.models import Forum
from django.core.mail import EmailMessage

class PostListSerializer(serializers.ModelSerializer):
    thread = serializers.HyperlinkedRelatedField(
        read_only=True,
        view_name='thread-detail'
    )
    creator = serializers.HyperlinkedRelatedField(
        read_only=True,
        view_name='user-detail',
        lookup_field='username'
    )
    class Meta:
        model = Post
        fields = (
            'id',
            'content',
            'thread',
            'created_at',
            'updated_at',
            'creator'
        )

class PostCreateSerializer(serializers.ModelSerializer):
    content = serializers.CharField(allow_blank=False)
    thread = serializers.HyperlinkedRelatedField(
        read_only=True,
        view_name='thread-detail'
    )
    thread_id = serializers.IntegerField(
        required=True,
        help_text=_('Requerido el id de la pregunta')
    )
    creator = serializers.HyperlinkedRelatedField(
        read_only=True,
        view_name='user-detail',
        lookup_field='username'
    )
    class Meta:
        model = Post
        fields = (
            'id',
            'content',
            'thread',
            'thread_id',
            'created_at',
            'updated_at',
            'creator'
        )
        read_only_fields=('id', 'thread', 'created_at', 'updated_at', 'creator',)

    def create(self, validated_data):
        content = validated_data['content']
        thread_id = validated_data['thread_id']
        # Get thread object
        try:
            thread = Thread.objects.get(id=thread_id)
        except Thread.DoesNotExist:
            raise serializers.ValidationError('La pregunta no existe, Ingrese la identificación correcta')
        # Get the requesting user
        user = None
        request = self.context.get("request")
        if request and hasattr(request, "user"):
            user = request.user
        else:
            raise serializers.ValidationError('Debe estar autenticado para responder')

        post = Post(
            content=content,
            thread=thread,
            creator=user
        )
        # Update the thread last_activity to post creation time
        post.save()
        thread.last_activity = post.created_at
        thread.save()

        try:
            #Antes de retornar envio el mensaje por correo
            usuario_creador_pregunta=User.objects.get(id=thread.creator_id)
            email_destino=usuario_creador_pregunta.email
            materia=Forum.objects.get(id=thread.forum_id)
            asunto = "NOTIFICACIÓN FORO INFORMÁTICO"
            mensaje=f"""
            Estimado @{usuario_creador_pregunta}
            @{user} respondió a tu pregunta: {thread}
            Materia: {materia.name}
            Enlace: http://localhost:3000/thread/{thread_id}
            """
            print(mensaje)
            mail = EmailMessage(asunto, mensaje, to=[email_destino])
            mail.send()
        except Exception:
            raise serializers.ValidationError(f'No fué posible notificar al creador de la pregunta que tu respondiste')

        return post

class PostUpdateSerializer(serializers.ModelSerializer):
    content = serializers.CharField(required=True)
    thread = serializers.HyperlinkedRelatedField(
        read_only=True,
        view_name='thread-detail'
    )
    creator = serializers.HyperlinkedRelatedField(
        read_only=True,
        view_name='user-detail',
        lookup_field='username'
    )
    class Meta:
        model = Post
        fields = (
            'id',
            'content',
            'thread',
            'created_at',
            'updated_at',
            'creator'
        )
        read_only_fields=('id', 'thread', 'created_at', 'updated_at', 'creator',)

    def update(self, instance, validated_data):
        # Update fields if there is any change
        for field, value in validated_data.items():
            setattr(instance, field, value)
        # Update 'updated_at' field to now
        setattr(instance, 'updated_at', now())

        # Note: If user update post, it won't change the last_activity
        instance.save()
        return instance


class PostDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = '__all__'

class PostDetailSerializer(serializers.ModelSerializer):
    thread = serializers.HyperlinkedRelatedField(
        read_only=True,
        view_name='thread-detail'
    )
    creator = serializers.HyperlinkedRelatedField(
        read_only=True,
        view_name='user-detail',
        lookup_field='username'
    )
    class Meta:
        model = Post
        fields = (
            'content',
            'thread',
            'created_at',
            'updated_at',
            'creator'
        )
