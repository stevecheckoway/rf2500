MSPCC := msp430-gcc
MSPDEBUG := mspdebug
MCU := msp430g2231
PROGRAMMER := rf2500

prog := led
objs := led.o

.PHONY: all clean install
all: $(prog)

$(prog): $(objs)
	$(MSPCC) -mmcu=$(MCU) -o $@ $+

%.o: %.c
	$(MSPCC) -mmcu=$(MCU) -c -o $@ $<

clean:
	$(RM) $(prog) $(objs)

install: $(prog)
	$(MSPDEBUG) -q $(PROGRAMMER) 'prog $(prog)'
