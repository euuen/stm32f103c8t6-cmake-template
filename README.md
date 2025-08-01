# 需要

1. Linux系统（推荐Arch Linux）
2. arm-none-eabi-gcc
3. arm-none-eabi-newlib（标准 C 库）​
4. cmake
5. make
6. stlink（stlink的驱动库）
7. openocd（用于烧录的工具）

# 如何使用本template？

使用vscode打开template，然后cd到`build`文件夹中执行`cmake ..`（注意两个点）。然后再返回根目录，执行`build.sh`，就可以进行编译了，最终会编译出`.elf`文件在根目录下面。

编译之后，就需要把程序烧录进stm32，此时，只需要执行`run.sh`文件就可以进行烧录了。烧录完成，stm32会自己复位然后运行。

不出意外的话，在编译和烧录之后，你接一个LED在`PA5`（正级）和`GND`（负极）之间，这个LED就会反复闪烁。

# 如何进行开发？

你应该到`Core/Src/main.c`中进行CRUD，其他地方不推荐更改（因为是标准库）
