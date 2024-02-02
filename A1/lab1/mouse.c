#include "types.h"
#include "defs.h"
#include "x86.h"
#include "mouse.h"
#include "traps.h"

// Wait until the mouse controller is ready for us to send a packet
void 
mousewait_send(void) 
{
    // Implement your code here
    int i;
    for(i = 0; i < 128 && !(inb(MSSTATP) & 0x2); i++);
    return;
}

// Wait until the mouse controller has data for us to receive
void 
mousewait_recv(void) 
{
    // Implement your code here
    int i;
    for (i = 0; i < 32 && (inb(MSSTATP) & 0x1); i++);
    return;
}

// Send a one-byte command to the mouse controller, and wait for it
// to be properly acknowledged
void 
mousecmd(uchar cmd) 
{
    // Implement your code here
    mousewait_send();
    outb(MSSTATP, PS2MS);
    mousewait_send();
    outb(MSDATAP, cmd);
    mousewait_recv();
    uchar ack;
    if ((ack = inb(MSDATAP)) != MSACK){
        cprintf("ACK Message received from mouse: %d\n", ack);
        panic("Not a valid ack for mouse");
    }
    return;
}

void
mouseinit(void)
{
    // Implement your code here
    // Enable Mouse
    mousewait_send();
    outb(MSSTATP, MSEN);

    // Send interrupt for mouse state change
    mousewait_send();
    outb(MSSTATP, 0x20);
    mousewait_recv();
    uchar status_byte = inb(MSDATAP) | 0x02;
    mousewait_send();
    outb(MSSTATP, 0x60);
    mousewait_send();
    outb(MSDATAP, status_byte);

    mousecmd(0xF6);     // Default Settings
    mousecmd(0xF4);     // Activate mouse and start sending interrupts
    ioapicenable(IRQ_MOUSE, 0);     // Receive mouse interrupt on CPU 0

    cprintf("Mouse has been initialized\n");    // Do not modify this line
    return;
}

void
mouseintr(void)
{
    uchar packet[3];

    // Implement your code here
    while (inb(MSSTATP) & 0x1){
        // Receive packet
        packet[0] = inb(MSDATAP);
        mousewait_recv();
        packet[1] = inb(MSDATAP);
        mousewait_recv();
        packet[2] = inb(MSDATAP);

        // Process the packet
        if (packet[0] & 0x1) cprintf("LEFT\n");     // Left Click
        if (packet[0] & 0x2) cprintf("RIGHT\n");    // Right Click
        if (packet[0] & 0x4) cprintf("MID\n");      // Middle Click
    }
    return;
}