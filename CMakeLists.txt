cmake_minimum_required(VERSION 3.15)

set(CMAKE_C_STANDARD 11)

project(Blink C)

# Set MCU and F_CPU
set(MCU atmega328p)
set(F_CPU 16000000UL)

# Add executable
add_executable(${PROJECT_NAME}.elf
    Src/main.c
)

set(CMAKE_VERBOSE_MAKEFILE ON CACHE BOOL "ON" FORCE)

# Include directories
target_include_directories(${PROJECT_NAME}.elf PRIVATE 
    ${CMAKE_SOURCE_DIR}/Inc
    ${CMAKE_SOURCE_DIR}/Src
)

# Generate HEX file
add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
    COMMAND avr-objcopy -O ihex ${PROJECT_NAME}.elf ${PROJECT_NAME}.hex
    COMMENT "Generating HEX file"
)

add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
    COMMAND avr-size --format=avr --mcu=${MCU} ${PROJECT_NAME}.elf
    COMMENT "Printing ELF size"
)

add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
    COMMAND avr-objdump -S -D ${PROJECT_NAME}.elf > ${PROJECT_NAME}.S
    COMMENT "Generating assembly listing file"
)

