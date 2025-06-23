#include <linux/module.h>
#include <linux/fs.h>
#include <media/v4l2-dev.h>
struct video_device *vdev;
static int __init init_vdevice(void)
{
    vdev = video_device_alloc();
    if(!vdev)
    {
        return -ENOMEM;
    }
    vdev->release = video_device_release;
    return 0;
}

static void __exit exit_vdevice(void)
{

}

module_init(init_vdevice);
module_exit(exit_vdevice);
MODULE_AUTHOR("viveksg");
MODULE_LICENSE("gpl");
MODULE_DESCRIPTION("v4l2 driver demo");