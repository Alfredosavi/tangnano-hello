SOURCES	:=	$(shell find . -name '*.v' -not -name '*_tb.v')
PWD			:= 	$(shell pwd)

DOCKER=docker
DOCKERARGS=run --rm -v $(PWD):/src -w /src

DEVICE_GOWINPACK=GW1N-9C

DEVICE_NEXTPNR=GW1NR-LV9QN88PC6/I5
FAMILY_NEXTPNR=GW1N-9C
CONSTRAINTS=tangnano9k.cst

MACRO_YOSYS = -D LEDS_NR=6 -D OSC_TYPE_OSC


YOSYS     = $(DOCKER) $(DOCKERARGS) hdlc/yosys yosys
NEXTPNR   = $(DOCKER) $(DOCKERARGS) alfredosavi/nextpnr-gowin nextpnr-gowin
GOWINPACK = $(DOCKER) $(DOCKERARGS) alfredosavi/nextpnr-gowin gowin_pack


all: top.fs

top.fs: top.pack
	$(GOWINPACK) -d $(DEVICE_GOWINPACK) -o $@ $^

top.pack: top.json
	$(NEXTPNR) --json $^ --write $@ --device $(DEVICE_NEXTPNR) --family $(FAMILY_NEXTPNR) --cst $(CONSTRAINTS)

top.json:
	$(YOSYS) $(MACRO_YOSYS) -p "synth_gowin -json top.json -top top" $(SOURCES)

prog: top.fs
	openFPGALoader -b tangnano $^

flash: top.fs
	openFPGALoader -b tangnano -f $^

reset:
	openFPGALoader --reset

clean:
	rm -f *.json *.fs *.pack

.PHONY: clean all prog flash reset
.PRECIOUS: top.json
