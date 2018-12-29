
ifneq ($(KERNELRELEASE),)

	obj-m := scull.o hello.o
	# /usr/src/linux-headers-4.15.0-43-generic/scripts/sign-file sha256 private_key.priv public_key.der hello.ko

else	

	KERN_DIR ?= /usr/src/linux-headers-$(shell uname -r)/
	PWD := $(shell pwd)

default:
	$(MAKE) -C $(KERN_DIR) M=$(PWD) modules

endif


clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions

