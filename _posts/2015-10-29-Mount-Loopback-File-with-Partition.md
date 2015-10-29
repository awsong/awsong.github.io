---
layout: post
title: How to mount disk image file with partition
---

One day I got a disk image with partition in it, like below, I like to mount the partitions and see what's in it.

```
$ /sbin/fdisk -l jessie-rpi2-20150705.img 
Disk jessie-rpi2-20150705.img: 3 GiB, 3221225472 bytes, 6291456 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xc96ffe28

Device                    Boot  Start     End Sectors  Size Id Type
jessie-rpi2-20150705.img1        2048  249855  247808  121M  e W95 FAT16 (LBA)
jessie-rpi2-20150705.img2      249856 6291455 6041600  2.9G 83 Linux
```

I searched online and found the solution [here](http://www.andremiller.net/content/mounting-hard-disk-image-including-partitions-using-linux).
But the solution is not elegant/convenient. I recall that partprobe can re-read partion table and update kernel after you alter your partition. Why not give it a try.

And it works! Here is how:
```
losetup /dev/loop0 jessie-rpi2-20150705.img
partprobe /dev/loop0
```

And that's it. Your new parttion to mount will be /dev/loop0px where x is the partion number within the disk image. 
