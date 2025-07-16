#include "main.h"


int main(void) {
    int data = 5000;
    data += 1000;
    printf("Data: %d\n", data);
    
    DDRB |= (1 << PB5); // Set PB5 as output (Arduino pin 13)
    while (1) {
        PORTB ^= (1 << PB5); // Toggle PB5
        _delay_ms(500); // Delay for 1000 milliseconds (1 second)
    }

}