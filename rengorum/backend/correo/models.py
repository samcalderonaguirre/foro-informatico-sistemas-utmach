from django.db import models

# Create your models here.
class Correo(models.Model):
    correo=models.EmailField(max_length=254,null=False)
    
    def __str__(self):
        return self.correo
    
    