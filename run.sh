#!/bin/bash
openocd -f interface/stlink-v2.cfg -f target/stm32f1x.cfg -c "program led.elf verify reset exit"