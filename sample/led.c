#include <msp430.h>

#define LED1 BIT0
#define LED2 BIT6
#define LED_OUT P1OUT
#define LED_DIR P1DIR

#define led_on(led) LED_OUT |= (led)
#define led_off(led) LED_OUT &= ~(led)
#define sleep(seconds) __delay_cycles((seconds) * 1000000)

void main(void)
{
	/* Disable the watchdog timer. */
	WDTCTL = WDTPW + WDTHOLD;

	/* Enable the LEDs, but make sure they're off. */
	LED_DIR = LED1 | LED2;
	led_off(LED1 | LED2);

	while (1)
	{
		led_on(LED1);
		sleep(1);
		led_off(LED1);
		sleep(1);
		led_on(LED2);
		sleep(1);
		led_off(LED2);
		sleep(1);
	}
}
