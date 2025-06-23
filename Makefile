BUILD_DIR=$(PWD)/output
obj-m := v4l2_driver.o
EXTRA_CFLAGS += -I$(PWD)/includes
HOST_KERN_DIR = /lib/modules/$(shell uname -r)/build/

all:
	make -C $(HOST_KERN_DIR)  M=$(PWD) modules
	mkdir -p $(BUILD_DIR)
	mv $(PWD)/.*.cmd $(BUILD_DIR)
	mv $(PWD)/*ko $(BUILD_DIR)
	mv $(PWD)/*symvers $(BUILD_DIR)
	mv $(PWD)/*order $(BUILD_DIR)
	mv $(PWD)/*o $(BUILD_DIR)
	mv $(PWD)/*mod* $(BUILD_DIR)
clean:
	make -C $(HOST_KERN_DIR) M=$(PWD) clean
	rm -rf $(BUILD_DIR)