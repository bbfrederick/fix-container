# fix-container
Containerized version of FSL FIX

This is based very closely on the excellent tutorial by NeuroSnippets
(https://neurosnippets.com/posts/fslfix-in-a-box/#post).  I've reordered the
build to make rebuilding it faster if you mess with things other than the dependencies,
added some informative tags, and fixed how NeuroDebian packages are accessed (for
some reason the build died when I tried it as specified in the article).

I've also added some support scripts for building and testing, and converting to 
singularity containers (what we use on our cluster).
