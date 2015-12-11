---
layout: post
title: Git/cURL SSL Problem
---

Symptom:

```
root@beaglebone:~# git clone https://github.com/derekmolloy/boneCV.git -v
Cloning into 'boneCV'...
fatal: unable to access 'https://github.com/derekmolloy/boneCV.git/': Problem with the SSL CA cert (path? access rights?)
```
or
```
root@NAS: /etc/ssl/certs # curl https://github.com/derekmolloy/boneCV.git
curl: (77) Problem with the SSL CA cert (path? access rights?)
```
But when run with "curl -v" it shows parsing error on /etc/ssl/certs/ca-certificates.crt.
Solution for me is to copy a good ca-certificate from another machine. There must be something wrong when generating ca-certificates.crt but I haven't found it.
