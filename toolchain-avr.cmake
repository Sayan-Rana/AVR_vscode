
# Set MCU and F_CPU
set(MCU atmega328p)
set(F_CPU 16000000UL)
set(OPTIMIZATION_LEVEL -Os) # Optimization level can be -O0, -O1, -O2, -O3, or -Os
set(C_STD c17)


set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_C_COMPILER avr-gcc)
set(CMAKE_C_FLAGS "-mmcu=${MCU} -DF_CPU=${F_CPU} ${OPTIMIZATION_LEVEL} -Wall")