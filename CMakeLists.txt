cmake_minimum_required (VERSION 4.0)

# 启用clangd代码检查
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

# 设置编译器
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)  # 避免编译器检查

# 设置项目名称
project (led C CXX ASM)

# 启用汇编
enable_language(ASM)

# 设置链接脚本
set(LINKER_SCRIPT ../STM32F103C8TX_FLASH.ld)

# 处理器架构设置
add_definitions(-DSTM32F103xB)
add_compile_options(-mcpu=cortex-m3 -mthumb -fdata-sections -ffunction-sections)
add_link_options(-mcpu=cortex-m3 -mthumb -specs=nano.specs -specs=nosys.specs -T${LINKER_SCRIPT} -Wl,--gc-sections)

# includes头文件
include_directories(/usr/arm-none-eabi/include)
include_directories(${CMAKE_SOURCE_DIR}/Core/Inc)
include_directories(${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32F1xx/Include)
include_directories(${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Include)
include_directories(${CMAKE_SOURCE_DIR}/Drivers/STM32F1xx_HAL_Driver/Inc)

aux_source_directory(${CMAKE_SOURCE_DIR}/Drivers/STM32F1xx_HAL_Driver/Src HAL)
aux_source_directory(${CMAKE_SOURCE_DIR}/Core/Src CORE)

# 设置elf输出路径
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR})

# 编译elf
add_executable(${PROJECT_NAME}.elf ${HAL} ${CORE} ${CMAKE_SOURCE_DIR}/Core/Startup/startup_stm32f103c8tx.s)