from django.shortcuts import render
from django.http import HttpResponse
from .models import Post

# Create your views here.

"""posts = [
    {
        'author':'NezanK',
        'title':'Blog Post 1',
        'content':'First Post content',
        'date_posted':'Oct 1, 2022'
    },
      {
        'author':'DostumK',
        'title':'Blog Post 2',
        'content':'Second Post content',
        'date_posted':'Oct 2, 2022'
    },
    ]"""
def home(request):
    context = {
        'posts': Post.objects.all()
    }
    return render(request,'blog/home.html',context)

def about(request):
    return render(request,'blog/about.html',{'title':'title'})