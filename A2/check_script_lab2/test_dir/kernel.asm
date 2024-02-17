
kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot_header>:
  100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fe 4f 52             	decb   0x52(%edi)
  10000b:	e4                   	.byte 0xe4

0010000c <_start>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
  10000c:	bc 30 08 11 00       	mov    $0x110830,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
  100011:	b8 68 08 10 00       	mov    $0x100868,%eax
  jmp *%eax
  100016:	ff e0                	jmp    *%eax

00100018 <outw>:
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  100018:	55                   	push   %ebp
  100019:	89 e5                	mov    %esp,%ebp
  10001b:	83 ec 08             	sub    $0x8,%esp
  10001e:	8b 55 08             	mov    0x8(%ebp),%edx
  100021:	8b 45 0c             	mov    0xc(%ebp),%eax
  100024:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100028:	66 89 45 f8          	mov    %ax,-0x8(%ebp)

  10002c:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  100030:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100034:	66 ef                	out    %ax,(%dx)
  if(sign)
  100036:	90                   	nop
  100037:	c9                   	leave
  100038:	c3                   	ret

00100039 <cli>:
      consputc(c);
      break;
    }
  }
}

  100039:	55                   	push   %ebp
  10003a:	89 e5                	mov    %esp,%ebp
void
  10003c:	fa                   	cli
halt(void)
  10003d:	90                   	nop
  10003e:	5d                   	pop    %ebp
  10003f:	c3                   	ret

00100040 <printint>:
{
  100040:	55                   	push   %ebp
  100041:	89 e5                	mov    %esp,%ebp
  100043:	83 ec 28             	sub    $0x28,%esp
  if(sign && (sign = xx < 0))
  100046:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10004a:	74 1c                	je     100068 <printint+0x28>
  10004c:	8b 45 08             	mov    0x8(%ebp),%eax
  10004f:	c1 e8 1f             	shr    $0x1f,%eax
  100052:	0f b6 c0             	movzbl %al,%eax
  100055:	89 45 10             	mov    %eax,0x10(%ebp)
  100058:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10005c:	74 0a                	je     100068 <printint+0x28>
    x = -xx;
  10005e:	8b 45 08             	mov    0x8(%ebp),%eax
  100061:	f7 d8                	neg    %eax
  100063:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100066:	eb 06                	jmp    10006e <printint+0x2e>
    x = xx;
  100068:	8b 45 08             	mov    0x8(%ebp),%eax
  10006b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  i = 0;
  10006e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    buf[i++] = digits[x % base];
  100075:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100078:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10007b:	ba 00 00 00 00       	mov    $0x0,%edx
  100080:	f7 f1                	div    %ecx
  100082:	89 d1                	mov    %edx,%ecx
  100084:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100087:	8d 50 01             	lea    0x1(%eax),%edx
  10008a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10008d:	0f b6 91 00 50 10 00 	movzbl 0x105000(%ecx),%edx
  100094:	88 54 05 e0          	mov    %dl,-0x20(%ebp,%eax,1)
  }while((x /= base) != 0);
  100098:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10009b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10009e:	ba 00 00 00 00       	mov    $0x0,%edx
  1000a3:	f7 f1                	div    %ecx
  1000a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1000a8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1000ac:	75 c7                	jne    100075 <printint+0x35>
  if(sign)
  1000ae:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1000b2:	74 2a                	je     1000de <printint+0x9e>
    buf[i++] = '-';
  1000b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000b7:	8d 50 01             	lea    0x1(%eax),%edx
  1000ba:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1000bd:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)
  while(--i >= 0)
  1000c2:	eb 1a                	jmp    1000de <printint+0x9e>
    consputc(buf[i]);
  1000c4:	8d 55 e0             	lea    -0x20(%ebp),%edx
  1000c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000ca:	01 d0                	add    %edx,%eax
  1000cc:	0f b6 00             	movzbl (%eax),%eax
  1000cf:	0f be c0             	movsbl %al,%eax
  1000d2:	83 ec 0c             	sub    $0xc,%esp
  1000d5:	50                   	push   %eax
  1000d6:	e8 5f 02 00 00       	call   10033a <consputc>
  1000db:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
  1000de:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1000e2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1000e6:	79 dc                	jns    1000c4 <printint+0x84>
}
  1000e8:	90                   	nop
  1000e9:	90                   	nop
  1000ea:	c9                   	leave
  1000eb:	c3                   	ret

001000ec <cprintf>:
{
  1000ec:	55                   	push   %ebp
  1000ed:	89 e5                	mov    %esp,%ebp
  1000ef:	83 ec 18             	sub    $0x18,%esp
  if (fmt == 0)
  1000f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1000f5:	85 c0                	test   %eax,%eax
  1000f7:	0f 84 63 01 00 00    	je     100260 <cprintf+0x174>
  argp = (uint*)(void*)(&fmt + 1);
  1000fd:	8d 45 0c             	lea    0xc(%ebp),%eax
  100100:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
  100103:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10010a:	e9 2f 01 00 00       	jmp    10023e <cprintf+0x152>
    if(c != '%'){
  10010f:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
  100113:	74 13                	je     100128 <cprintf+0x3c>
      consputc(c);
  100115:	83 ec 0c             	sub    $0xc,%esp
  100118:	ff 75 e8             	push   -0x18(%ebp)
  10011b:	e8 1a 02 00 00       	call   10033a <consputc>
  100120:	83 c4 10             	add    $0x10,%esp
      continue;
  100123:	e9 12 01 00 00       	jmp    10023a <cprintf+0x14e>
    c = fmt[++i] & 0xff;
  100128:	8b 55 08             	mov    0x8(%ebp),%edx
  10012b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10012f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100132:	01 d0                	add    %edx,%eax
  100134:	0f b6 00             	movzbl (%eax),%eax
  100137:	0f be c0             	movsbl %al,%eax
  10013a:	25 ff 00 00 00       	and    $0xff,%eax
  10013f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(c == 0)
  100142:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  100146:	0f 84 17 01 00 00    	je     100263 <cprintf+0x177>
    switch(c){
  10014c:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
  100150:	74 5e                	je     1001b0 <cprintf+0xc4>
  100152:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
  100156:	0f 8f c2 00 00 00    	jg     10021e <cprintf+0x132>
  10015c:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
  100160:	74 6b                	je     1001cd <cprintf+0xe1>
  100162:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
  100166:	0f 8f b2 00 00 00    	jg     10021e <cprintf+0x132>
  10016c:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
  100170:	74 3e                	je     1001b0 <cprintf+0xc4>
  100172:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
  100176:	0f 8f a2 00 00 00    	jg     10021e <cprintf+0x132>
  10017c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
  100180:	0f 84 89 00 00 00    	je     10020f <cprintf+0x123>
  100186:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
  10018a:	0f 85 8e 00 00 00    	jne    10021e <cprintf+0x132>
      printint(*argp++, 10, 1);
  100190:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100193:	8d 50 04             	lea    0x4(%eax),%edx
  100196:	89 55 f0             	mov    %edx,-0x10(%ebp)
  100199:	8b 00                	mov    (%eax),%eax
  10019b:	83 ec 04             	sub    $0x4,%esp
  10019e:	6a 01                	push   $0x1
  1001a0:	6a 0a                	push   $0xa
  1001a2:	50                   	push   %eax
  1001a3:	e8 98 fe ff ff       	call   100040 <printint>
  1001a8:	83 c4 10             	add    $0x10,%esp
      break;
  1001ab:	e9 8a 00 00 00       	jmp    10023a <cprintf+0x14e>
      printint(*argp++, 16, 0);
  1001b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1001b3:	8d 50 04             	lea    0x4(%eax),%edx
  1001b6:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1001b9:	8b 00                	mov    (%eax),%eax
  1001bb:	83 ec 04             	sub    $0x4,%esp
  1001be:	6a 00                	push   $0x0
  1001c0:	6a 10                	push   $0x10
  1001c2:	50                   	push   %eax
  1001c3:	e8 78 fe ff ff       	call   100040 <printint>
  1001c8:	83 c4 10             	add    $0x10,%esp
      break;
  1001cb:	eb 6d                	jmp    10023a <cprintf+0x14e>
      if((s = (char*)*argp++) == 0)
  1001cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1001d0:	8d 50 04             	lea    0x4(%eax),%edx
  1001d3:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1001d6:	8b 00                	mov    (%eax),%eax
  1001d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1001db:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1001df:	75 22                	jne    100203 <cprintf+0x117>
        s = "(null)";
  1001e1:	c7 45 ec 5c 41 10 00 	movl   $0x10415c,-0x14(%ebp)
      for(; *s; s++)
  1001e8:	eb 19                	jmp    100203 <cprintf+0x117>
        consputc(*s);
  1001ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1001ed:	0f b6 00             	movzbl (%eax),%eax
  1001f0:	0f be c0             	movsbl %al,%eax
  1001f3:	83 ec 0c             	sub    $0xc,%esp
  1001f6:	50                   	push   %eax
  1001f7:	e8 3e 01 00 00       	call   10033a <consputc>
  1001fc:	83 c4 10             	add    $0x10,%esp
      for(; *s; s++)
  1001ff:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100203:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100206:	0f b6 00             	movzbl (%eax),%eax
  100209:	84 c0                	test   %al,%al
  10020b:	75 dd                	jne    1001ea <cprintf+0xfe>
      break;
  10020d:	eb 2b                	jmp    10023a <cprintf+0x14e>
      consputc('%');
  10020f:	83 ec 0c             	sub    $0xc,%esp
  100212:	6a 25                	push   $0x25
  100214:	e8 21 01 00 00       	call   10033a <consputc>
  100219:	83 c4 10             	add    $0x10,%esp
      break;
  10021c:	eb 1c                	jmp    10023a <cprintf+0x14e>
      consputc('%');
  10021e:	83 ec 0c             	sub    $0xc,%esp
  100221:	6a 25                	push   $0x25
  100223:	e8 12 01 00 00       	call   10033a <consputc>
  100228:	83 c4 10             	add    $0x10,%esp
      consputc(c);
  10022b:	83 ec 0c             	sub    $0xc,%esp
  10022e:	ff 75 e8             	push   -0x18(%ebp)
  100231:	e8 04 01 00 00       	call   10033a <consputc>
  100236:	83 c4 10             	add    $0x10,%esp
      break;
  100239:	90                   	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
  10023a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10023e:	8b 55 08             	mov    0x8(%ebp),%edx
  100241:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100244:	01 d0                	add    %edx,%eax
  100246:	0f b6 00             	movzbl (%eax),%eax
  100249:	0f be c0             	movsbl %al,%eax
  10024c:	25 ff 00 00 00       	and    $0xff,%eax
  100251:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100254:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  100258:	0f 85 b1 fe ff ff    	jne    10010f <cprintf+0x23>
  10025e:	eb 04                	jmp    100264 <cprintf+0x178>
    return;
  100260:	90                   	nop
  100261:	eb 01                	jmp    100264 <cprintf+0x178>
      break;
  100263:	90                   	nop
}
  100264:	c9                   	leave
  100265:	c3                   	ret

00100266 <halt>:
{
  100266:	55                   	push   %ebp
  100267:	89 e5                	mov    %esp,%ebp
  100269:	83 ec 08             	sub    $0x8,%esp
  cprintf("Bye COL%d!\n\0", 331);
  10026c:	83 ec 08             	sub    $0x8,%esp
  10026f:	68 4b 01 00 00       	push   $0x14b
  100274:	68 63 41 10 00       	push   $0x104163
  100279:	e8 6e fe ff ff       	call   1000ec <cprintf>
  10027e:	83 c4 10             	add    $0x10,%esp
  outw(0x602, 0x2000);
  100281:	83 ec 08             	sub    $0x8,%esp
  100284:	68 00 20 00 00       	push   $0x2000
  100289:	68 02 06 00 00       	push   $0x602
  10028e:	e8 85 fd ff ff       	call   100018 <outw>
  100293:	83 c4 10             	add    $0x10,%esp
  // For older versions of QEMU, 
  outw(0xB002, 0x2000);
  100296:	83 ec 08             	sub    $0x8,%esp
  100299:	68 00 20 00 00       	push   $0x2000
  10029e:	68 02 b0 00 00       	push   $0xb002
  1002a3:	e8 70 fd ff ff       	call   100018 <outw>
  1002a8:	83 c4 10             	add    $0x10,%esp
  for(;;);
  1002ab:	eb fe                	jmp    1002ab <halt+0x45>

001002ad <panic>:
}

void
panic(char *s)
{
  1002ad:	55                   	push   %ebp
  1002ae:	89 e5                	mov    %esp,%ebp
  1002b0:	83 ec 38             	sub    $0x38,%esp
  int i;
  uint pcs[10];

  cli();
  1002b3:	e8 81 fd ff ff       	call   100039 <cli>
  cprintf("lapicid %d: panic: ", lapicid());
  1002b8:	e8 57 04 00 00       	call   100714 <lapicid>
  1002bd:	83 ec 08             	sub    $0x8,%esp
  1002c0:	50                   	push   %eax
  1002c1:	68 70 41 10 00       	push   $0x104170
  1002c6:	e8 21 fe ff ff       	call   1000ec <cprintf>
  1002cb:	83 c4 10             	add    $0x10,%esp
  cprintf(s);
  1002ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1002d1:	83 ec 0c             	sub    $0xc,%esp
  1002d4:	50                   	push   %eax
  1002d5:	e8 12 fe ff ff       	call   1000ec <cprintf>
  1002da:	83 c4 10             	add    $0x10,%esp
  cprintf("\n");
  1002dd:	83 ec 0c             	sub    $0xc,%esp
  1002e0:	68 84 41 10 00       	push   $0x104184
  1002e5:	e8 02 fe ff ff       	call   1000ec <cprintf>
  1002ea:	83 c4 10             	add    $0x10,%esp
  getcallerpcs(&s, pcs);
  1002ed:	83 ec 08             	sub    $0x8,%esp
  1002f0:	8d 45 cc             	lea    -0x34(%ebp),%eax
  1002f3:	50                   	push   %eax
  1002f4:	8d 45 08             	lea    0x8(%ebp),%eax
  1002f7:	50                   	push   %eax
  1002f8:	e8 ad 0e 00 00       	call   1011aa <getcallerpcs>
  1002fd:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
  100300:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100307:	eb 1c                	jmp    100325 <panic+0x78>
    cprintf(" %p", pcs[i]);
  100309:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10030c:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
  100310:	83 ec 08             	sub    $0x8,%esp
  100313:	50                   	push   %eax
  100314:	68 86 41 10 00       	push   $0x104186
  100319:	e8 ce fd ff ff       	call   1000ec <cprintf>
  10031e:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
  100321:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100325:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  100329:	7e de                	jle    100309 <panic+0x5c>
  panicked = 1; // freeze other CPU
  10032b:	c7 05 ac 54 10 00 01 	movl   $0x1,0x1054ac
  100332:	00 00 00 
  halt();
  100335:	e8 2c ff ff ff       	call   100266 <halt>

0010033a <consputc>:

#define BACKSPACE 0x100

void
consputc(int c)
{
  10033a:	55                   	push   %ebp
  10033b:	89 e5                	mov    %esp,%ebp
  10033d:	83 ec 08             	sub    $0x8,%esp
  if(c == BACKSPACE){
  100340:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
  100347:	75 29                	jne    100372 <consputc+0x38>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  100349:	83 ec 0c             	sub    $0xc,%esp
  10034c:	6a 08                	push   $0x8
  10034e:	e8 5a 0a 00 00       	call   100dad <uartputc>
  100353:	83 c4 10             	add    $0x10,%esp
  100356:	83 ec 0c             	sub    $0xc,%esp
  100359:	6a 20                	push   $0x20
  10035b:	e8 4d 0a 00 00       	call   100dad <uartputc>
  100360:	83 c4 10             	add    $0x10,%esp
  100363:	83 ec 0c             	sub    $0xc,%esp
  100366:	6a 08                	push   $0x8
  100368:	e8 40 0a 00 00       	call   100dad <uartputc>
  10036d:	83 c4 10             	add    $0x10,%esp
  } else
    uartputc(c);
}
  100370:	eb 0e                	jmp    100380 <consputc+0x46>
    uartputc(c);
  100372:	83 ec 0c             	sub    $0xc,%esp
  100375:	ff 75 08             	push   0x8(%ebp)
  100378:	e8 30 0a 00 00       	call   100dad <uartputc>
  10037d:	83 c4 10             	add    $0x10,%esp
}
  100380:	90                   	nop
  100381:	c9                   	leave
  100382:	c3                   	ret

00100383 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
  100383:	55                   	push   %ebp
  100384:	89 e5                	mov    %esp,%ebp
  100386:	83 ec 18             	sub    $0x18,%esp
  int c;

  while((c = getc()) >= 0){
  100389:	e9 17 01 00 00       	jmp    1004a5 <consoleintr+0x122>
    switch(c){
  10038e:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
  100392:	74 63                	je     1003f7 <consoleintr+0x74>
  100394:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
  100398:	0f 8f 8b 00 00 00    	jg     100429 <consoleintr+0xa6>
  10039e:	83 7d f4 08          	cmpl   $0x8,-0xc(%ebp)
  1003a2:	74 53                	je     1003f7 <consoleintr+0x74>
  1003a4:	83 7d f4 15          	cmpl   $0x15,-0xc(%ebp)
  1003a8:	75 7f                	jne    100429 <consoleintr+0xa6>
    case C('U'):  // Kill line.
      while(input.e != input.w &&
  1003aa:	eb 1d                	jmp    1003c9 <consoleintr+0x46>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
  1003ac:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  1003b1:	83 e8 01             	sub    $0x1,%eax
  1003b4:	a3 a8 54 10 00       	mov    %eax,0x1054a8
        consputc(BACKSPACE);
  1003b9:	83 ec 0c             	sub    $0xc,%esp
  1003bc:	68 00 01 00 00       	push   $0x100
  1003c1:	e8 74 ff ff ff       	call   10033a <consputc>
  1003c6:	83 c4 10             	add    $0x10,%esp
      while(input.e != input.w &&
  1003c9:	8b 15 a8 54 10 00    	mov    0x1054a8,%edx
  1003cf:	a1 a4 54 10 00       	mov    0x1054a4,%eax
  1003d4:	39 c2                	cmp    %eax,%edx
  1003d6:	0f 84 c9 00 00 00    	je     1004a5 <consoleintr+0x122>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
  1003dc:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  1003e1:	83 e8 01             	sub    $0x1,%eax
  1003e4:	83 e0 7f             	and    $0x7f,%eax
  1003e7:	0f b6 80 20 54 10 00 	movzbl 0x105420(%eax),%eax
      while(input.e != input.w &&
  1003ee:	3c 0a                	cmp    $0xa,%al
  1003f0:	75 ba                	jne    1003ac <consoleintr+0x29>
      }
      break;
  1003f2:	e9 ae 00 00 00       	jmp    1004a5 <consoleintr+0x122>
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
  1003f7:	8b 15 a8 54 10 00    	mov    0x1054a8,%edx
  1003fd:	a1 a4 54 10 00       	mov    0x1054a4,%eax
  100402:	39 c2                	cmp    %eax,%edx
  100404:	0f 84 9b 00 00 00    	je     1004a5 <consoleintr+0x122>
        input.e--;
  10040a:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  10040f:	83 e8 01             	sub    $0x1,%eax
  100412:	a3 a8 54 10 00       	mov    %eax,0x1054a8
        consputc(BACKSPACE);
  100417:	83 ec 0c             	sub    $0xc,%esp
  10041a:	68 00 01 00 00       	push   $0x100
  10041f:	e8 16 ff ff ff       	call   10033a <consputc>
  100424:	83 c4 10             	add    $0x10,%esp
      }
      break;
  100427:	eb 7c                	jmp    1004a5 <consoleintr+0x122>
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
  100429:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10042d:	74 75                	je     1004a4 <consoleintr+0x121>
  10042f:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  100434:	8b 15 a0 54 10 00    	mov    0x1054a0,%edx
  10043a:	29 d0                	sub    %edx,%eax
  10043c:	83 f8 7f             	cmp    $0x7f,%eax
  10043f:	77 63                	ja     1004a4 <consoleintr+0x121>
        c = (c == '\r') ? '\n' : c;
  100441:	83 7d f4 0d          	cmpl   $0xd,-0xc(%ebp)
  100445:	74 05                	je     10044c <consoleintr+0xc9>
  100447:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10044a:	eb 05                	jmp    100451 <consoleintr+0xce>
  10044c:	b8 0a 00 00 00       	mov    $0xa,%eax
  100451:	89 45 f4             	mov    %eax,-0xc(%ebp)
        input.buf[input.e++ % INPUT_BUF] = c;
  100454:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  100459:	8d 50 01             	lea    0x1(%eax),%edx
  10045c:	89 15 a8 54 10 00    	mov    %edx,0x1054a8
  100462:	83 e0 7f             	and    $0x7f,%eax
  100465:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100468:	88 90 20 54 10 00    	mov    %dl,0x105420(%eax)
        consputc(c);
  10046e:	83 ec 0c             	sub    $0xc,%esp
  100471:	ff 75 f4             	push   -0xc(%ebp)
  100474:	e8 c1 fe ff ff       	call   10033a <consputc>
  100479:	83 c4 10             	add    $0x10,%esp
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
  10047c:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
  100480:	74 18                	je     10049a <consoleintr+0x117>
  100482:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
  100486:	74 12                	je     10049a <consoleintr+0x117>
  100488:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  10048d:	8b 15 a0 54 10 00    	mov    0x1054a0,%edx
  100493:	83 ea 80             	sub    $0xffffff80,%edx
  100496:	39 d0                	cmp    %edx,%eax
  100498:	75 0a                	jne    1004a4 <consoleintr+0x121>
          input.w = input.e;
  10049a:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  10049f:	a3 a4 54 10 00       	mov    %eax,0x1054a4
        }
      }
      break;
  1004a4:	90                   	nop
  while((c = getc()) >= 0){
  1004a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1004a8:	ff d0                	call   *%eax
  1004aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1004ad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b1:	0f 89 d7 fe ff ff    	jns    10038e <consoleintr+0xb>
    }
  }
  1004b7:	90                   	nop
  1004b8:	90                   	nop
  1004b9:	c9                   	leave
  1004ba:	c3                   	ret

001004bb <ioapicread>:
  uint data;
};

static uint
ioapicread(int reg)
{
  1004bb:	55                   	push   %ebp
  1004bc:	89 e5                	mov    %esp,%ebp
  ioapic->reg = reg;
  1004be:	a1 b0 54 10 00       	mov    0x1054b0,%eax
  1004c3:	8b 55 08             	mov    0x8(%ebp),%edx
  1004c6:	89 10                	mov    %edx,(%eax)
  return ioapic->data;
  1004c8:	a1 b0 54 10 00       	mov    0x1054b0,%eax
  1004cd:	8b 40 10             	mov    0x10(%eax),%eax
}
  1004d0:	5d                   	pop    %ebp
  1004d1:	c3                   	ret

001004d2 <ioapicwrite>:

static void
ioapicwrite(int reg, uint data)
{
  1004d2:	55                   	push   %ebp
  1004d3:	89 e5                	mov    %esp,%ebp
  ioapic->reg = reg;
  1004d5:	a1 b0 54 10 00       	mov    0x1054b0,%eax
  1004da:	8b 55 08             	mov    0x8(%ebp),%edx
  1004dd:	89 10                	mov    %edx,(%eax)
  ioapic->data = data;
  1004df:	a1 b0 54 10 00       	mov    0x1054b0,%eax
  1004e4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1004e7:	89 50 10             	mov    %edx,0x10(%eax)
}
  1004ea:	90                   	nop
  1004eb:	5d                   	pop    %ebp
  1004ec:	c3                   	ret

001004ed <ioapicinit>:

void
ioapicinit(void)
{
  1004ed:	55                   	push   %ebp
  1004ee:	89 e5                	mov    %esp,%ebp
  1004f0:	83 ec 18             	sub    $0x18,%esp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  1004f3:	c7 05 b0 54 10 00 00 	movl   $0xfec00000,0x1054b0
  1004fa:	00 c0 fe 
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  1004fd:	6a 01                	push   $0x1
  1004ff:	e8 b7 ff ff ff       	call   1004bb <ioapicread>
  100504:	83 c4 04             	add    $0x4,%esp
  100507:	c1 e8 10             	shr    $0x10,%eax
  10050a:	25 ff 00 00 00       	and    $0xff,%eax
  10050f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  id = ioapicread(REG_ID) >> 24;
  100512:	6a 00                	push   $0x0
  100514:	e8 a2 ff ff ff       	call   1004bb <ioapicread>
  100519:	83 c4 04             	add    $0x4,%esp
  10051c:	c1 e8 18             	shr    $0x18,%eax
  10051f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(id != ioapicid)
  100522:	0f b6 05 c4 54 10 00 	movzbl 0x1054c4,%eax
  100529:	0f b6 c0             	movzbl %al,%eax
  10052c:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  10052f:	74 10                	je     100541 <ioapicinit+0x54>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
  100531:	83 ec 0c             	sub    $0xc,%esp
  100534:	68 8c 41 10 00       	push   $0x10418c
  100539:	e8 ae fb ff ff       	call   1000ec <cprintf>
  10053e:	83 c4 10             	add    $0x10,%esp

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
  100541:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100548:	eb 3f                	jmp    100589 <ioapicinit+0x9c>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
  10054a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10054d:	83 c0 20             	add    $0x20,%eax
  100550:	0d 00 00 01 00       	or     $0x10000,%eax
  100555:	89 c2                	mov    %eax,%edx
  100557:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10055a:	83 c0 08             	add    $0x8,%eax
  10055d:	01 c0                	add    %eax,%eax
  10055f:	83 ec 08             	sub    $0x8,%esp
  100562:	52                   	push   %edx
  100563:	50                   	push   %eax
  100564:	e8 69 ff ff ff       	call   1004d2 <ioapicwrite>
  100569:	83 c4 10             	add    $0x10,%esp
    ioapicwrite(REG_TABLE+2*i+1, 0);
  10056c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10056f:	83 c0 08             	add    $0x8,%eax
  100572:	01 c0                	add    %eax,%eax
  100574:	83 c0 01             	add    $0x1,%eax
  100577:	83 ec 08             	sub    $0x8,%esp
  10057a:	6a 00                	push   $0x0
  10057c:	50                   	push   %eax
  10057d:	e8 50 ff ff ff       	call   1004d2 <ioapicwrite>
  100582:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i <= maxintr; i++){
  100585:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100589:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10058c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  10058f:	7e b9                	jle    10054a <ioapicinit+0x5d>
  }
}
  100591:	90                   	nop
  100592:	90                   	nop
  100593:	c9                   	leave
  100594:	c3                   	ret

00100595 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
  100595:	55                   	push   %ebp
  100596:	89 e5                	mov    %esp,%ebp
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  100598:	8b 45 08             	mov    0x8(%ebp),%eax
  10059b:	83 c0 20             	add    $0x20,%eax
  10059e:	89 c2                	mov    %eax,%edx
  1005a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a3:	83 c0 08             	add    $0x8,%eax
  1005a6:	01 c0                	add    %eax,%eax
  1005a8:	52                   	push   %edx
  1005a9:	50                   	push   %eax
  1005aa:	e8 23 ff ff ff       	call   1004d2 <ioapicwrite>
  1005af:	83 c4 08             	add    $0x8,%esp
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
  1005b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005b5:	c1 e0 18             	shl    $0x18,%eax
  1005b8:	89 c2                	mov    %eax,%edx
  1005ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1005bd:	83 c0 08             	add    $0x8,%eax
  1005c0:	01 c0                	add    %eax,%eax
  1005c2:	83 c0 01             	add    $0x1,%eax
  1005c5:	52                   	push   %edx
  1005c6:	50                   	push   %eax
  1005c7:	e8 06 ff ff ff       	call   1004d2 <ioapicwrite>
  1005cc:	83 c4 08             	add    $0x8,%esp
}
  1005cf:	90                   	nop
  1005d0:	c9                   	leave
  1005d1:	c3                   	ret

001005d2 <lapicw>:

volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  1005d2:	55                   	push   %ebp
  1005d3:	89 e5                	mov    %esp,%ebp
  lapic[index] = value;
  1005d5:	8b 15 b4 54 10 00    	mov    0x1054b4,%edx
  1005db:	8b 45 08             	mov    0x8(%ebp),%eax
  1005de:	c1 e0 02             	shl    $0x2,%eax
  1005e1:	01 c2                	add    %eax,%edx
  1005e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e6:	89 02                	mov    %eax,(%edx)
  lapic[ID];  // wait for write to finish, by reading
  1005e8:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  1005ed:	83 c0 20             	add    $0x20,%eax
  1005f0:	8b 00                	mov    (%eax),%eax
}
  1005f2:	90                   	nop
  1005f3:	5d                   	pop    %ebp
  1005f4:	c3                   	ret

001005f5 <lapicinit>:

void
lapicinit(void)
{
  1005f5:	55                   	push   %ebp
  1005f6:	89 e5                	mov    %esp,%ebp
  if(!lapic)
  1005f8:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  1005fd:	85 c0                	test   %eax,%eax
  1005ff:	0f 84 0c 01 00 00    	je     100711 <lapicinit+0x11c>
    return;

  // Enable local APIC; set spurious interrupt vector.
  lapicw(SVR, ENABLE | (T_IRQ0 + IRQ_SPURIOUS));
  100605:	68 3f 01 00 00       	push   $0x13f
  10060a:	6a 3c                	push   $0x3c
  10060c:	e8 c1 ff ff ff       	call   1005d2 <lapicw>
  100611:	83 c4 08             	add    $0x8,%esp

  // The timer repeatedly counts down at bus frequency
  // from lapic[TICR] and then issues an interrupt.
  // If xv6 cared more about precise timekeeping,
  // TICR would be calibrated using an external time source.
  lapicw(TDCR, X1);
  100614:	6a 0b                	push   $0xb
  100616:	68 f8 00 00 00       	push   $0xf8
  10061b:	e8 b2 ff ff ff       	call   1005d2 <lapicw>
  100620:	83 c4 08             	add    $0x8,%esp
  lapicw(TIMER, PERIODIC | (T_IRQ0 + IRQ_TIMER));
  100623:	68 20 00 02 00       	push   $0x20020
  100628:	68 c8 00 00 00       	push   $0xc8
  10062d:	e8 a0 ff ff ff       	call   1005d2 <lapicw>
  100632:	83 c4 08             	add    $0x8,%esp
  lapicw(TICR, 10000000);
  100635:	68 80 96 98 00       	push   $0x989680
  10063a:	68 e0 00 00 00       	push   $0xe0
  10063f:	e8 8e ff ff ff       	call   1005d2 <lapicw>
  100644:	83 c4 08             	add    $0x8,%esp

  // Disable logical interrupt lines.
  lapicw(LINT0, MASKED);
  100647:	68 00 00 01 00       	push   $0x10000
  10064c:	68 d4 00 00 00       	push   $0xd4
  100651:	e8 7c ff ff ff       	call   1005d2 <lapicw>
  100656:	83 c4 08             	add    $0x8,%esp
  lapicw(LINT1, MASKED);
  100659:	68 00 00 01 00       	push   $0x10000
  10065e:	68 d8 00 00 00       	push   $0xd8
  100663:	e8 6a ff ff ff       	call   1005d2 <lapicw>
  100668:	83 c4 08             	add    $0x8,%esp

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
  10066b:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  100670:	83 c0 30             	add    $0x30,%eax
  100673:	8b 00                	mov    (%eax),%eax
  100675:	c1 e8 10             	shr    $0x10,%eax
  100678:	25 fc 00 00 00       	and    $0xfc,%eax
  10067d:	85 c0                	test   %eax,%eax
  10067f:	74 12                	je     100693 <lapicinit+0x9e>
    lapicw(PCINT, MASKED);
  100681:	68 00 00 01 00       	push   $0x10000
  100686:	68 d0 00 00 00       	push   $0xd0
  10068b:	e8 42 ff ff ff       	call   1005d2 <lapicw>
  100690:	83 c4 08             	add    $0x8,%esp

  // Map error interrupt to IRQ_ERROR.
  lapicw(ERROR, T_IRQ0 + IRQ_ERROR);
  100693:	6a 33                	push   $0x33
  100695:	68 dc 00 00 00       	push   $0xdc
  10069a:	e8 33 ff ff ff       	call   1005d2 <lapicw>
  10069f:	83 c4 08             	add    $0x8,%esp

  // Clear error status register (requires back-to-back writes).
  lapicw(ESR, 0);
  1006a2:	6a 00                	push   $0x0
  1006a4:	68 a0 00 00 00       	push   $0xa0
  1006a9:	e8 24 ff ff ff       	call   1005d2 <lapicw>
  1006ae:	83 c4 08             	add    $0x8,%esp
  lapicw(ESR, 0);
  1006b1:	6a 00                	push   $0x0
  1006b3:	68 a0 00 00 00       	push   $0xa0
  1006b8:	e8 15 ff ff ff       	call   1005d2 <lapicw>
  1006bd:	83 c4 08             	add    $0x8,%esp

  // Ack any outstanding interrupts.
  lapicw(EOI, 0);
  1006c0:	6a 00                	push   $0x0
  1006c2:	6a 2c                	push   $0x2c
  1006c4:	e8 09 ff ff ff       	call   1005d2 <lapicw>
  1006c9:	83 c4 08             	add    $0x8,%esp

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  1006cc:	6a 00                	push   $0x0
  1006ce:	68 c4 00 00 00       	push   $0xc4
  1006d3:	e8 fa fe ff ff       	call   1005d2 <lapicw>
  1006d8:	83 c4 08             	add    $0x8,%esp
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  1006db:	68 00 85 08 00       	push   $0x88500
  1006e0:	68 c0 00 00 00       	push   $0xc0
  1006e5:	e8 e8 fe ff ff       	call   1005d2 <lapicw>
  1006ea:	83 c4 08             	add    $0x8,%esp
  while(lapic[ICRLO] & DELIVS)
  1006ed:	90                   	nop
  1006ee:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  1006f3:	05 00 03 00 00       	add    $0x300,%eax
  1006f8:	8b 00                	mov    (%eax),%eax
  1006fa:	25 00 10 00 00       	and    $0x1000,%eax
  1006ff:	85 c0                	test   %eax,%eax
  100701:	75 eb                	jne    1006ee <lapicinit+0xf9>
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
  100703:	6a 00                	push   $0x0
  100705:	6a 20                	push   $0x20
  100707:	e8 c6 fe ff ff       	call   1005d2 <lapicw>
  10070c:	83 c4 08             	add    $0x8,%esp
  10070f:	eb 01                	jmp    100712 <lapicinit+0x11d>
    return;
  100711:	90                   	nop
}
  100712:	c9                   	leave
  100713:	c3                   	ret

00100714 <lapicid>:

int
lapicid(void)
{
  100714:	55                   	push   %ebp
  100715:	89 e5                	mov    %esp,%ebp
  if (!lapic)
  100717:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  10071c:	85 c0                	test   %eax,%eax
  10071e:	75 07                	jne    100727 <lapicid+0x13>
    return 0;
  100720:	b8 00 00 00 00       	mov    $0x0,%eax
  100725:	eb 0d                	jmp    100734 <lapicid+0x20>
  return lapic[ID] >> 24;
  100727:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  10072c:	83 c0 20             	add    $0x20,%eax
  10072f:	8b 00                	mov    (%eax),%eax
  100731:	c1 e8 18             	shr    $0x18,%eax
}
  100734:	5d                   	pop    %ebp
  100735:	c3                   	ret

00100736 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  100736:	55                   	push   %ebp
  100737:	89 e5                	mov    %esp,%ebp
  if(lapic)
  100739:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  10073e:	85 c0                	test   %eax,%eax
  100740:	74 0c                	je     10074e <lapiceoi+0x18>
    lapicw(EOI, 0);
  100742:	6a 00                	push   $0x0
  100744:	6a 2c                	push   $0x2c
  100746:	e8 87 fe ff ff       	call   1005d2 <lapicw>
  10074b:	83 c4 08             	add    $0x8,%esp
}
  10074e:	90                   	nop
  10074f:	c9                   	leave
  100750:	c3                   	ret

00100751 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
  100751:	55                   	push   %ebp
  100752:	89 e5                	mov    %esp,%ebp
  100754:	90                   	nop
  100755:	5d                   	pop    %ebp
  100756:	c3                   	ret

00100757 <sti>:
  100757:	55                   	push   %ebp
  100758:	89 e5                	mov    %esp,%ebp
  10075a:	fb                   	sti
  10075b:	90                   	nop
  10075c:	5d                   	pop    %ebp
  10075d:	c3                   	ret

0010075e <wfi>:
  10075e:	55                   	push   %ebp
  10075f:	89 e5                	mov    %esp,%ebp
  100761:	f4                   	hlt
  100762:	90                   	nop
  100763:	5d                   	pop    %ebp
  100764:	c3                   	ret

00100765 <log_test>:
log_test(void) {
  100765:	55                   	push   %ebp
  100766:	89 e5                	mov    %esp,%ebp
  100768:	81 ec 18 02 00 00    	sub    $0x218,%esp
  if((gtxt=open("/hello.txt", O_RDONLY)) == 0) {
  10076e:	83 ec 08             	sub    $0x8,%esp
  100771:	6a 00                	push   $0x0
  100773:	68 c0 41 10 00       	push   $0x1041c0
  100778:	e8 8f 34 00 00       	call   103c0c <open>
  10077d:	83 c4 10             	add    $0x10,%esp
  100780:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100783:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100787:	75 0d                	jne    100796 <log_test+0x31>
    panic("Unable to open /hello.txt");
  100789:	83 ec 0c             	sub    $0xc,%esp
  10078c:	68 cb 41 10 00       	push   $0x1041cb
  100791:	e8 17 fb ff ff       	call   1002ad <panic>
  n = fileread(gtxt, buffer, 5);
  100796:	83 ec 04             	sub    $0x4,%esp
  100799:	6a 05                	push   $0x5
  10079b:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  1007a1:	50                   	push   %eax
  1007a2:	ff 75 f4             	push   -0xc(%ebp)
  1007a5:	e8 eb 2e 00 00       	call   103695 <fileread>
  1007aa:	83 c4 10             	add    $0x10,%esp
  1007ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cprintf("[UNDOLOG] READ: %d %s\n", n, buffer);
  1007b0:	83 ec 04             	sub    $0x4,%esp
  1007b3:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  1007b9:	50                   	push   %eax
  1007ba:	ff 75 f0             	push   -0x10(%ebp)
  1007bd:	68 e5 41 10 00       	push   $0x1041e5
  1007c2:	e8 25 f9 ff ff       	call   1000ec <cprintf>
  1007c7:	83 c4 10             	add    $0x10,%esp
  fileclose(gtxt);
  1007ca:	83 ec 0c             	sub    $0xc,%esp
  1007cd:	ff 75 f4             	push   -0xc(%ebp)
  1007d0:	e8 ec 2d 00 00       	call   1035c1 <fileclose>
  1007d5:	83 c4 10             	add    $0x10,%esp
  buffer[0] = '0' + PANIC_1;
  1007d8:	c6 85 f0 fd ff ff 30 	movb   $0x30,-0x210(%ebp)
  buffer[1] = '0' + PANIC_2;
  1007df:	c6 85 f1 fd ff ff 30 	movb   $0x30,-0x20f(%ebp)
  buffer[2] = '0' + PANIC_3;
  1007e6:	c6 85 f2 fd ff ff 30 	movb   $0x30,-0x20e(%ebp)
  buffer[3] = '0' + PANIC_4;
  1007ed:	c6 85 f3 fd ff ff 30 	movb   $0x30,-0x20d(%ebp)
  buffer[4] = '0' + PANIC_5;
  1007f4:	c6 85 f4 fd ff ff 30 	movb   $0x30,-0x20c(%ebp)
  if((gtxt = open("/hello.txt", O_WRONLY)) == 0){
  1007fb:	83 ec 08             	sub    $0x8,%esp
  1007fe:	6a 01                	push   $0x1
  100800:	68 c0 41 10 00       	push   $0x1041c0
  100805:	e8 02 34 00 00       	call   103c0c <open>
  10080a:	83 c4 10             	add    $0x10,%esp
  10080d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100810:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100814:	75 0d                	jne    100823 <log_test+0xbe>
    panic("Failed to create /foo/hello.txt");
  100816:	83 ec 0c             	sub    $0xc,%esp
  100819:	68 fc 41 10 00       	push   $0x1041fc
  10081e:	e8 8a fa ff ff       	call   1002ad <panic>
  n = filewrite(gtxt, buffer, 5);
  100823:	83 ec 04             	sub    $0x4,%esp
  100826:	6a 05                	push   $0x5
  100828:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  10082e:	50                   	push   %eax
  10082f:	ff 75 f4             	push   -0xc(%ebp)
  100832:	e8 dd 2e 00 00       	call   103714 <filewrite>
  100837:	83 c4 10             	add    $0x10,%esp
  10083a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cprintf("[UNDOLOG] WRITE: %d %s\n", n, buffer);
  10083d:	83 ec 04             	sub    $0x4,%esp
  100840:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  100846:	50                   	push   %eax
  100847:	ff 75 f0             	push   -0x10(%ebp)
  10084a:	68 1c 42 10 00       	push   $0x10421c
  10084f:	e8 98 f8 ff ff       	call   1000ec <cprintf>
  100854:	83 c4 10             	add    $0x10,%esp
  fileclose(gtxt);
  100857:	83 ec 0c             	sub    $0xc,%esp
  10085a:	ff 75 f4             	push   -0xc(%ebp)
  10085d:	e8 5f 2d 00 00       	call   1035c1 <fileclose>
  100862:	83 c4 10             	add    $0x10,%esp
}
  100865:	90                   	nop
  100866:	c9                   	leave
  100867:	c3                   	ret

00100868 <main>:
{
  100868:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  10086c:	83 e4 f0             	and    $0xfffffff0,%esp
  10086f:	ff 71 fc             	push   -0x4(%ecx)
  100872:	55                   	push   %ebp
  100873:	89 e5                	mov    %esp,%ebp
  100875:	51                   	push   %ecx
  100876:	83 ec 04             	sub    $0x4,%esp
  mpinit();        // detect other processors
  100879:	e8 85 02 00 00       	call   100b03 <mpinit>
  lapicinit();     // interrupt controller
  10087e:	e8 72 fd ff ff       	call   1005f5 <lapicinit>
  picinit();       // disable pic
  100883:	e8 d9 03 00 00       	call   100c61 <picinit>
  ioapicinit();    // another interrupt controller
  100888:	e8 60 fc ff ff       	call   1004ed <ioapicinit>
  uartinit();      // serial port
  10088d:	e8 34 04 00 00       	call   100cc6 <uartinit>
  ideinit();       // disk 
  100892:	e8 b7 1a 00 00       	call   10234e <ideinit>
  tvinit();        // trap vectors
  100897:	e8 ca 09 00 00       	call   101266 <tvinit>
  binit();         // buffer cache
  10089c:	e8 ea 15 00 00       	call   101e8b <binit>
  idtinit();       // load idt register
  1008a1:	e8 a6 0a 00 00       	call   10134c <idtinit>
  sti();           // enable interrupts
  1008a6:	e8 ac fe ff ff       	call   100757 <sti>
  iinit(ROOTDEV);  // Read superblock to start reading inodes
  1008ab:	83 ec 0c             	sub    $0xc,%esp
  1008ae:	6a 01                	push   $0x1
  1008b0:	e8 7c 20 00 00       	call   102931 <iinit>
  1008b5:	83 c4 10             	add    $0x10,%esp
  initlog(ROOTDEV);  // Initialize log
  1008b8:	83 ec 0c             	sub    $0xc,%esp
  1008bb:	6a 01                	push   $0x1
  1008bd:	e8 c2 34 00 00       	call   103d84 <initlog>
  1008c2:	83 c4 10             	add    $0x10,%esp
  log_test();
  1008c5:	e8 9b fe ff ff       	call   100765 <log_test>
    wfi();
  1008ca:	e8 8f fe ff ff       	call   10075e <wfi>
  1008cf:	eb f9                	jmp    1008ca <main+0x62>

001008d1 <inb>:
// Multiprocessor support
// Search memory for MP description structures.
// http://developer.intel.com/design/pentium/datashts/24201606.pdf

#include "types.h"
  1008d1:	55                   	push   %ebp
  1008d2:	89 e5                	mov    %esp,%ebp
  1008d4:	83 ec 14             	sub    $0x14,%esp
  1008d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1008da:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
#include "defs.h"
#include "param.h"
// #include "memlayout.h"
  1008de:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1008e2:	89 c2                	mov    %eax,%edx
  1008e4:	ec                   	in     (%dx),%al
  1008e5:	88 45 ff             	mov    %al,-0x1(%ebp)
#include "mp.h"
  1008e8:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
#include "x86.h"
  1008ec:	c9                   	leave
  1008ed:	c3                   	ret

001008ee <outb>:
static uchar
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  1008ee:	55                   	push   %ebp
  1008ef:	89 e5                	mov    %esp,%ebp
  1008f1:	83 ec 08             	sub    $0x8,%esp
  1008f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1008f7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1008fa:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1008fe:	89 d0                	mov    %edx,%eax
  100900:	88 45 f8             	mov    %al,-0x8(%ebp)
  for(i=0; i<len; i++)
  100903:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100907:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  10090b:	ee                   	out    %al,(%dx)
    sum += addr[i];
  10090c:	90                   	nop
  10090d:	c9                   	leave
  10090e:	c3                   	ret

0010090f <sum>:
{
  10090f:	55                   	push   %ebp
  100910:	89 e5                	mov    %esp,%ebp
  100912:	83 ec 10             	sub    $0x10,%esp
  sum = 0;
  100915:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  for(i=0; i<len; i++)
  10091c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100923:	eb 15                	jmp    10093a <sum+0x2b>
    sum += addr[i];
  100925:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100928:	8b 45 08             	mov    0x8(%ebp),%eax
  10092b:	01 d0                	add    %edx,%eax
  10092d:	0f b6 00             	movzbl (%eax),%eax
  100930:	0f b6 c0             	movzbl %al,%eax
  100933:	01 45 f8             	add    %eax,-0x8(%ebp)
  for(i=0; i<len; i++)
  100936:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10093a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10093d:	3b 45 0c             	cmp    0xc(%ebp),%eax
  100940:	7c e3                	jl     100925 <sum+0x16>
  return sum;
  100942:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  100945:	c9                   	leave
  100946:	c3                   	ret

00100947 <mpsearch1>:

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
  100947:	55                   	push   %ebp
  100948:	89 e5                	mov    %esp,%ebp
  10094a:	83 ec 18             	sub    $0x18,%esp
  uchar *e, *p, *addr;

  // addr = P2V(a);
  addr = (uchar*) a;
  10094d:	8b 45 08             	mov    0x8(%ebp),%eax
  100950:	89 45 f0             	mov    %eax,-0x10(%ebp)
  e = addr+len;
  100953:	8b 55 0c             	mov    0xc(%ebp),%edx
  100956:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100959:	01 d0                	add    %edx,%eax
  10095b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  for(p = addr; p < e; p += sizeof(struct mp))
  10095e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100961:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100964:	eb 36                	jmp    10099c <mpsearch1+0x55>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
  100966:	83 ec 04             	sub    $0x4,%esp
  100969:	6a 04                	push   $0x4
  10096b:	68 34 42 10 00       	push   $0x104234
  100970:	ff 75 f4             	push   -0xc(%ebp)
  100973:	e8 96 05 00 00       	call   100f0e <memcmp>
  100978:	83 c4 10             	add    $0x10,%esp
  10097b:	85 c0                	test   %eax,%eax
  10097d:	75 19                	jne    100998 <mpsearch1+0x51>
  10097f:	83 ec 08             	sub    $0x8,%esp
  100982:	6a 10                	push   $0x10
  100984:	ff 75 f4             	push   -0xc(%ebp)
  100987:	e8 83 ff ff ff       	call   10090f <sum>
  10098c:	83 c4 10             	add    $0x10,%esp
  10098f:	84 c0                	test   %al,%al
  100991:	75 05                	jne    100998 <mpsearch1+0x51>
      return (struct mp*)p;
  100993:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100996:	eb 11                	jmp    1009a9 <mpsearch1+0x62>
  for(p = addr; p < e; p += sizeof(struct mp))
  100998:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  10099c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10099f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1009a2:	72 c2                	jb     100966 <mpsearch1+0x1f>
  return 0;
  1009a4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1009a9:	c9                   	leave
  1009aa:	c3                   	ret

001009ab <mpsearch>:
// 1) in the first KB of the EBDA;
// 2) in the last KB of system base memory;
// 3) in the BIOS ROM between 0xE0000 and 0xFFFFF.
static struct mp*
mpsearch(void)
{
  1009ab:	55                   	push   %ebp
  1009ac:	89 e5                	mov    %esp,%ebp
  1009ae:	83 ec 18             	sub    $0x18,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  // bda = (uchar *) P2V(0x400);
  bda = (uchar *) 0x400;
  1009b1:	c7 45 f4 00 04 00 00 	movl   $0x400,-0xc(%ebp)
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
  1009b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009bb:	83 c0 0f             	add    $0xf,%eax
  1009be:	0f b6 00             	movzbl (%eax),%eax
  1009c1:	0f b6 c0             	movzbl %al,%eax
  1009c4:	c1 e0 08             	shl    $0x8,%eax
  1009c7:	89 c2                	mov    %eax,%edx
  1009c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009cc:	83 c0 0e             	add    $0xe,%eax
  1009cf:	0f b6 00             	movzbl (%eax),%eax
  1009d2:	0f b6 c0             	movzbl %al,%eax
  1009d5:	09 d0                	or     %edx,%eax
  1009d7:	c1 e0 04             	shl    $0x4,%eax
  1009da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1009dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1009e1:	74 21                	je     100a04 <mpsearch+0x59>
    if((mp = mpsearch1(p, 1024)))
  1009e3:	83 ec 08             	sub    $0x8,%esp
  1009e6:	68 00 04 00 00       	push   $0x400
  1009eb:	ff 75 f0             	push   -0x10(%ebp)
  1009ee:	e8 54 ff ff ff       	call   100947 <mpsearch1>
  1009f3:	83 c4 10             	add    $0x10,%esp
  1009f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1009f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1009fd:	74 51                	je     100a50 <mpsearch+0xa5>
      return mp;
  1009ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a02:	eb 61                	jmp    100a65 <mpsearch+0xba>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
  100a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a07:	83 c0 14             	add    $0x14,%eax
  100a0a:	0f b6 00             	movzbl (%eax),%eax
  100a0d:	0f b6 c0             	movzbl %al,%eax
  100a10:	c1 e0 08             	shl    $0x8,%eax
  100a13:	89 c2                	mov    %eax,%edx
  100a15:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a18:	83 c0 13             	add    $0x13,%eax
  100a1b:	0f b6 00             	movzbl (%eax),%eax
  100a1e:	0f b6 c0             	movzbl %al,%eax
  100a21:	09 d0                	or     %edx,%eax
  100a23:	c1 e0 0a             	shl    $0xa,%eax
  100a26:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((mp = mpsearch1(p-1024, 1024)))
  100a29:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a2c:	2d 00 04 00 00       	sub    $0x400,%eax
  100a31:	83 ec 08             	sub    $0x8,%esp
  100a34:	68 00 04 00 00       	push   $0x400
  100a39:	50                   	push   %eax
  100a3a:	e8 08 ff ff ff       	call   100947 <mpsearch1>
  100a3f:	83 c4 10             	add    $0x10,%esp
  100a42:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100a45:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100a49:	74 05                	je     100a50 <mpsearch+0xa5>
      return mp;
  100a4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a4e:	eb 15                	jmp    100a65 <mpsearch+0xba>
  }
  return mpsearch1(0xF0000, 0x10000);
  100a50:	83 ec 08             	sub    $0x8,%esp
  100a53:	68 00 00 01 00       	push   $0x10000
  100a58:	68 00 00 0f 00       	push   $0xf0000
  100a5d:	e8 e5 fe ff ff       	call   100947 <mpsearch1>
  100a62:	83 c4 10             	add    $0x10,%esp
}
  100a65:	c9                   	leave
  100a66:	c3                   	ret

00100a67 <mpconfig>:
// Check for correct signature, calculate the checksum and,
// if correct, check the version.
// To do: check extended table checksum.
static struct mpconf*
mpconfig(struct mp **pmp)
{
  100a67:	55                   	push   %ebp
  100a68:	89 e5                	mov    %esp,%ebp
  100a6a:	83 ec 18             	sub    $0x18,%esp
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
  100a6d:	e8 39 ff ff ff       	call   1009ab <mpsearch>
  100a72:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a75:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a79:	74 0a                	je     100a85 <mpconfig+0x1e>
  100a7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a7e:	8b 40 04             	mov    0x4(%eax),%eax
  100a81:	85 c0                	test   %eax,%eax
  100a83:	75 07                	jne    100a8c <mpconfig+0x25>
    return 0;
  100a85:	b8 00 00 00 00       	mov    $0x0,%eax
  100a8a:	eb 75                	jmp    100b01 <mpconfig+0x9a>
  // conf = (struct mpconf*) P2V((uint) mp->physaddr);
  conf = (struct mpconf*) (uint) mp->physaddr;
  100a8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a8f:	8b 40 04             	mov    0x4(%eax),%eax
  100a92:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
  100a95:	83 ec 04             	sub    $0x4,%esp
  100a98:	6a 04                	push   $0x4
  100a9a:	68 39 42 10 00       	push   $0x104239
  100a9f:	ff 75 f0             	push   -0x10(%ebp)
  100aa2:	e8 67 04 00 00       	call   100f0e <memcmp>
  100aa7:	83 c4 10             	add    $0x10,%esp
  100aaa:	85 c0                	test   %eax,%eax
  100aac:	74 07                	je     100ab5 <mpconfig+0x4e>
    return 0;
  100aae:	b8 00 00 00 00       	mov    $0x0,%eax
  100ab3:	eb 4c                	jmp    100b01 <mpconfig+0x9a>
  if(conf->version != 1 && conf->version != 4)
  100ab5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ab8:	0f b6 40 06          	movzbl 0x6(%eax),%eax
  100abc:	3c 01                	cmp    $0x1,%al
  100abe:	74 12                	je     100ad2 <mpconfig+0x6b>
  100ac0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ac3:	0f b6 40 06          	movzbl 0x6(%eax),%eax
  100ac7:	3c 04                	cmp    $0x4,%al
  100ac9:	74 07                	je     100ad2 <mpconfig+0x6b>
    return 0;
  100acb:	b8 00 00 00 00       	mov    $0x0,%eax
  100ad0:	eb 2f                	jmp    100b01 <mpconfig+0x9a>
  if(sum((uchar*)conf, conf->length) != 0)
  100ad2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ad5:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100ad9:	0f b7 c0             	movzwl %ax,%eax
  100adc:	83 ec 08             	sub    $0x8,%esp
  100adf:	50                   	push   %eax
  100ae0:	ff 75 f0             	push   -0x10(%ebp)
  100ae3:	e8 27 fe ff ff       	call   10090f <sum>
  100ae8:	83 c4 10             	add    $0x10,%esp
  100aeb:	84 c0                	test   %al,%al
  100aed:	74 07                	je     100af6 <mpconfig+0x8f>
    return 0;
  100aef:	b8 00 00 00 00       	mov    $0x0,%eax
  100af4:	eb 0b                	jmp    100b01 <mpconfig+0x9a>
  *pmp = mp;
  100af6:	8b 45 08             	mov    0x8(%ebp),%eax
  100af9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100afc:	89 10                	mov    %edx,(%eax)
  return conf;
  100afe:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100b01:	c9                   	leave
  100b02:	c3                   	ret

00100b03 <mpinit>:

void
mpinit(void)
{
  100b03:	55                   	push   %ebp
  100b04:	89 e5                	mov    %esp,%ebp
  100b06:	83 ec 28             	sub    $0x28,%esp
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
  100b09:	83 ec 0c             	sub    $0xc,%esp
  100b0c:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100b0f:	50                   	push   %eax
  100b10:	e8 52 ff ff ff       	call   100a67 <mpconfig>
  100b15:	83 c4 10             	add    $0x10,%esp
  100b18:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100b1b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100b1f:	75 0d                	jne    100b2e <mpinit+0x2b>
    panic("Expect to run on an SMP");
  100b21:	83 ec 0c             	sub    $0xc,%esp
  100b24:	68 3e 42 10 00       	push   $0x10423e
  100b29:	e8 7f f7 ff ff       	call   1002ad <panic>
  ismp = 1;
  100b2e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  lapic = (uint*)conf->lapicaddr;
  100b35:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100b38:	8b 40 24             	mov    0x24(%eax),%eax
  100b3b:	a3 b4 54 10 00       	mov    %eax,0x1054b4
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
  100b40:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100b43:	83 c0 2c             	add    $0x2c,%eax
  100b46:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100b49:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100b4c:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100b50:	0f b7 d0             	movzwl %ax,%edx
  100b53:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100b56:	01 d0                	add    %edx,%eax
  100b58:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100b5b:	e9 83 00 00 00       	jmp    100be3 <mpinit+0xe0>
    switch(*p){
  100b60:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b63:	0f b6 00             	movzbl (%eax),%eax
  100b66:	0f b6 c0             	movzbl %al,%eax
  100b69:	83 f8 04             	cmp    $0x4,%eax
  100b6c:	7f 6d                	jg     100bdb <mpinit+0xd8>
  100b6e:	83 f8 03             	cmp    $0x3,%eax
  100b71:	7d 62                	jge    100bd5 <mpinit+0xd2>
  100b73:	83 f8 02             	cmp    $0x2,%eax
  100b76:	74 45                	je     100bbd <mpinit+0xba>
  100b78:	83 f8 02             	cmp    $0x2,%eax
  100b7b:	7f 5e                	jg     100bdb <mpinit+0xd8>
  100b7d:	85 c0                	test   %eax,%eax
  100b7f:	74 07                	je     100b88 <mpinit+0x85>
  100b81:	83 f8 01             	cmp    $0x1,%eax
  100b84:	74 4f                	je     100bd5 <mpinit+0xd2>
  100b86:	eb 53                	jmp    100bdb <mpinit+0xd8>
    case MPPROC:
      proc = (struct mpproc*)p;
  100b88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b8b:	89 45 e0             	mov    %eax,-0x20(%ebp)
      if(ncpu < NCPU) {
  100b8e:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  100b93:	83 f8 07             	cmp    $0x7,%eax
  100b96:	7f 1f                	jg     100bb7 <mpinit+0xb4>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
  100b98:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  100b9d:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100ba0:	0f b6 52 01          	movzbl 0x1(%edx),%edx
  100ba4:	88 90 b8 54 10 00    	mov    %dl,0x1054b8(%eax)
        ncpu++;
  100baa:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  100baf:	83 c0 01             	add    $0x1,%eax
  100bb2:	a3 c0 54 10 00       	mov    %eax,0x1054c0
      }
      p += sizeof(struct mpproc);
  100bb7:	83 45 f4 14          	addl   $0x14,-0xc(%ebp)
      continue;
  100bbb:	eb 26                	jmp    100be3 <mpinit+0xe0>
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
  100bbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bc0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      ioapicid = ioapic->apicno;
  100bc3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100bc6:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  100bca:	a2 c4 54 10 00       	mov    %al,0x1054c4
      p += sizeof(struct mpioapic);
  100bcf:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
      continue;
  100bd3:	eb 0e                	jmp    100be3 <mpinit+0xe0>
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
  100bd5:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
      continue;
  100bd9:	eb 08                	jmp    100be3 <mpinit+0xe0>
    default:
      ismp = 0;
  100bdb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      break;
  100be2:	90                   	nop
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
  100be3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100be6:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  100be9:	0f 82 71 ff ff ff    	jb     100b60 <mpinit+0x5d>
    }
  }
  if(!ismp)
  100bef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bf3:	75 0d                	jne    100c02 <mpinit+0xff>
    panic("Didn't find a suitable machine");
  100bf5:	83 ec 0c             	sub    $0xc,%esp
  100bf8:	68 58 42 10 00       	push   $0x104258
  100bfd:	e8 ab f6 ff ff       	call   1002ad <panic>

  if(mp->imcrp){
  100c02:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100c05:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
  100c09:	84 c0                	test   %al,%al
  100c0b:	74 30                	je     100c3d <mpinit+0x13a>
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
  100c0d:	83 ec 08             	sub    $0x8,%esp
  100c10:	6a 70                	push   $0x70
  100c12:	6a 22                	push   $0x22
  100c14:	e8 d5 fc ff ff       	call   1008ee <outb>
  100c19:	83 c4 10             	add    $0x10,%esp
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  100c1c:	83 ec 0c             	sub    $0xc,%esp
  100c1f:	6a 23                	push   $0x23
  100c21:	e8 ab fc ff ff       	call   1008d1 <inb>
  100c26:	83 c4 10             	add    $0x10,%esp
  100c29:	83 c8 01             	or     $0x1,%eax
  100c2c:	0f b6 c0             	movzbl %al,%eax
  100c2f:	83 ec 08             	sub    $0x8,%esp
  100c32:	50                   	push   %eax
  100c33:	6a 23                	push   $0x23
  100c35:	e8 b4 fc ff ff       	call   1008ee <outb>
  100c3a:	83 c4 10             	add    $0x10,%esp
  }
}
  100c3d:	90                   	nop
  100c3e:	c9                   	leave
  100c3f:	c3                   	ret

00100c40 <outb>:
  100c40:	55                   	push   %ebp
  100c41:	89 e5                	mov    %esp,%ebp
  100c43:	83 ec 08             	sub    $0x8,%esp
  100c46:	8b 45 08             	mov    0x8(%ebp),%eax
  100c49:	8b 55 0c             	mov    0xc(%ebp),%edx
  100c4c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  100c50:	89 d0                	mov    %edx,%eax
  100c52:	88 45 f8             	mov    %al,-0x8(%ebp)
  100c55:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100c59:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100c5d:	ee                   	out    %al,(%dx)
  100c5e:	90                   	nop
  100c5f:	c9                   	leave
  100c60:	c3                   	ret

00100c61 <picinit>:
{
  100c61:	55                   	push   %ebp
  100c62:	89 e5                	mov    %esp,%ebp
  outb(IO_PIC1+1, 0xFF);
  100c64:	68 ff 00 00 00       	push   $0xff
  100c69:	6a 21                	push   $0x21
  100c6b:	e8 d0 ff ff ff       	call   100c40 <outb>
  100c70:	83 c4 08             	add    $0x8,%esp
  outb(IO_PIC2+1, 0xFF);
  100c73:	68 ff 00 00 00       	push   $0xff
  100c78:	68 a1 00 00 00       	push   $0xa1
  100c7d:	e8 be ff ff ff       	call   100c40 <outb>
  100c82:	83 c4 08             	add    $0x8,%esp
  100c85:	90                   	nop
  100c86:	c9                   	leave
  100c87:	c3                   	ret

00100c88 <inb>:
// Intel 8250 serial port (UART).

#include "types.h"
#include "defs.h"
#include "param.h"
  100c88:	55                   	push   %ebp
  100c89:	89 e5                	mov    %esp,%ebp
  100c8b:	83 ec 14             	sub    $0x14,%esp
  100c8e:	8b 45 08             	mov    0x8(%ebp),%eax
  100c91:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
#include "x86.h"
#include "traps.h"

  100c95:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  100c99:	89 c2                	mov    %eax,%edx
  100c9b:	ec                   	in     (%dx),%al
  100c9c:	88 45 ff             	mov    %al,-0x1(%ebp)
#define COM1    0x3f8
  100c9f:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax

  100ca3:	c9                   	leave
  100ca4:	c3                   	ret

00100ca5 <outb>:
  // Turn off the FIFO
  outb(COM1+2, 0);

  // 9600 baud, 8 data bits, 1 stop bit, parity off.
  outb(COM1+3, 0x80);    // Unlock divisor
  outb(COM1+0, 115200/9600);
  100ca5:	55                   	push   %ebp
  100ca6:	89 e5                	mov    %esp,%ebp
  100ca8:	83 ec 08             	sub    $0x8,%esp
  100cab:	8b 45 08             	mov    0x8(%ebp),%eax
  100cae:	8b 55 0c             	mov    0xc(%ebp),%edx
  100cb1:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  100cb5:	89 d0                	mov    %edx,%eax
  100cb7:	88 45 f8             	mov    %al,-0x8(%ebp)
  outb(COM1+1, 0);
  100cba:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100cbe:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100cc2:	ee                   	out    %al,(%dx)
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  100cc3:	90                   	nop
  100cc4:	c9                   	leave
  100cc5:	c3                   	ret

00100cc6 <uartinit>:
{
  100cc6:	55                   	push   %ebp
  100cc7:	89 e5                	mov    %esp,%ebp
  100cc9:	83 ec 18             	sub    $0x18,%esp
  outb(COM1+2, 0);
  100ccc:	6a 00                	push   $0x0
  100cce:	68 fa 03 00 00       	push   $0x3fa
  100cd3:	e8 cd ff ff ff       	call   100ca5 <outb>
  100cd8:	83 c4 08             	add    $0x8,%esp
  outb(COM1+3, 0x80);    // Unlock divisor
  100cdb:	68 80 00 00 00       	push   $0x80
  100ce0:	68 fb 03 00 00       	push   $0x3fb
  100ce5:	e8 bb ff ff ff       	call   100ca5 <outb>
  100cea:	83 c4 08             	add    $0x8,%esp
  outb(COM1+0, 115200/9600);
  100ced:	6a 0c                	push   $0xc
  100cef:	68 f8 03 00 00       	push   $0x3f8
  100cf4:	e8 ac ff ff ff       	call   100ca5 <outb>
  100cf9:	83 c4 08             	add    $0x8,%esp
  outb(COM1+1, 0);
  100cfc:	6a 00                	push   $0x0
  100cfe:	68 f9 03 00 00       	push   $0x3f9
  100d03:	e8 9d ff ff ff       	call   100ca5 <outb>
  100d08:	83 c4 08             	add    $0x8,%esp
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  100d0b:	6a 03                	push   $0x3
  100d0d:	68 fb 03 00 00       	push   $0x3fb
  100d12:	e8 8e ff ff ff       	call   100ca5 <outb>
  100d17:	83 c4 08             	add    $0x8,%esp
  outb(COM1+4, 0);
  100d1a:	6a 00                	push   $0x0
  100d1c:	68 fc 03 00 00       	push   $0x3fc
  100d21:	e8 7f ff ff ff       	call   100ca5 <outb>
  100d26:	83 c4 08             	add    $0x8,%esp
  outb(COM1+1, 0x01);    // Enable receive interrupts.
  100d29:	6a 01                	push   $0x1
  100d2b:	68 f9 03 00 00       	push   $0x3f9
  100d30:	e8 70 ff ff ff       	call   100ca5 <outb>
  100d35:	83 c4 08             	add    $0x8,%esp

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
  100d38:	68 fd 03 00 00       	push   $0x3fd
  100d3d:	e8 46 ff ff ff       	call   100c88 <inb>
  100d42:	83 c4 04             	add    $0x4,%esp
  100d45:	3c ff                	cmp    $0xff,%al
  100d47:	74 61                	je     100daa <uartinit+0xe4>
    return;
  uart = 1;
  100d49:	c7 05 c8 54 10 00 01 	movl   $0x1,0x1054c8
  100d50:	00 00 00 

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  100d53:	68 fa 03 00 00       	push   $0x3fa
  100d58:	e8 2b ff ff ff       	call   100c88 <inb>
  100d5d:	83 c4 04             	add    $0x4,%esp
  inb(COM1+0);
  100d60:	68 f8 03 00 00       	push   $0x3f8
  100d65:	e8 1e ff ff ff       	call   100c88 <inb>
  100d6a:	83 c4 04             	add    $0x4,%esp
  ioapicenable(IRQ_COM1, 0);
  100d6d:	83 ec 08             	sub    $0x8,%esp
  100d70:	6a 00                	push   $0x0
  100d72:	6a 04                	push   $0x4
  100d74:	e8 1c f8 ff ff       	call   100595 <ioapicenable>
  100d79:	83 c4 10             	add    $0x10,%esp

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
  100d7c:	c7 45 f4 77 42 10 00 	movl   $0x104277,-0xc(%ebp)
  100d83:	eb 19                	jmp    100d9e <uartinit+0xd8>
    uartputc(*p);
  100d85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d88:	0f b6 00             	movzbl (%eax),%eax
  100d8b:	0f be c0             	movsbl %al,%eax
  100d8e:	83 ec 0c             	sub    $0xc,%esp
  100d91:	50                   	push   %eax
  100d92:	e8 16 00 00 00       	call   100dad <uartputc>
  100d97:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
  100d9a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100d9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100da1:	0f b6 00             	movzbl (%eax),%eax
  100da4:	84 c0                	test   %al,%al
  100da6:	75 dd                	jne    100d85 <uartinit+0xbf>
  100da8:	eb 01                	jmp    100dab <uartinit+0xe5>
    return;
  100daa:	90                   	nop
}
  100dab:	c9                   	leave
  100dac:	c3                   	ret

00100dad <uartputc>:

void
uartputc(int c)
{
  100dad:	55                   	push   %ebp
  100dae:	89 e5                	mov    %esp,%ebp
  100db0:	83 ec 10             	sub    $0x10,%esp
  int i;

  if(!uart)
  100db3:	a1 c8 54 10 00       	mov    0x1054c8,%eax
  100db8:	85 c0                	test   %eax,%eax
  100dba:	74 40                	je     100dfc <uartputc+0x4f>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++);
  100dbc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100dc3:	eb 04                	jmp    100dc9 <uartputc+0x1c>
  100dc5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100dc9:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  100dcd:	7f 17                	jg     100de6 <uartputc+0x39>
  100dcf:	68 fd 03 00 00       	push   $0x3fd
  100dd4:	e8 af fe ff ff       	call   100c88 <inb>
  100dd9:	83 c4 04             	add    $0x4,%esp
  100ddc:	0f b6 c0             	movzbl %al,%eax
  100ddf:	83 e0 20             	and    $0x20,%eax
  100de2:	85 c0                	test   %eax,%eax
  100de4:	74 df                	je     100dc5 <uartputc+0x18>
  outb(COM1+0, c);
  100de6:	8b 45 08             	mov    0x8(%ebp),%eax
  100de9:	0f b6 c0             	movzbl %al,%eax
  100dec:	50                   	push   %eax
  100ded:	68 f8 03 00 00       	push   $0x3f8
  100df2:	e8 ae fe ff ff       	call   100ca5 <outb>
  100df7:	83 c4 08             	add    $0x8,%esp
  100dfa:	eb 01                	jmp    100dfd <uartputc+0x50>
    return;
  100dfc:	90                   	nop
}
  100dfd:	c9                   	leave
  100dfe:	c3                   	ret

00100dff <uartgetc>:


static int
uartgetc(void)
{
  100dff:	55                   	push   %ebp
  100e00:	89 e5                	mov    %esp,%ebp
  if(!uart)
  100e02:	a1 c8 54 10 00       	mov    0x1054c8,%eax
  100e07:	85 c0                	test   %eax,%eax
  100e09:	75 07                	jne    100e12 <uartgetc+0x13>
    return -1;
  100e0b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e10:	eb 2e                	jmp    100e40 <uartgetc+0x41>
  if(!(inb(COM1+5) & 0x01))
  100e12:	68 fd 03 00 00       	push   $0x3fd
  100e17:	e8 6c fe ff ff       	call   100c88 <inb>
  100e1c:	83 c4 04             	add    $0x4,%esp
  100e1f:	0f b6 c0             	movzbl %al,%eax
  100e22:	83 e0 01             	and    $0x1,%eax
  100e25:	85 c0                	test   %eax,%eax
  100e27:	75 07                	jne    100e30 <uartgetc+0x31>
    return -1;
  100e29:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e2e:	eb 10                	jmp    100e40 <uartgetc+0x41>
  return inb(COM1+0);
  100e30:	68 f8 03 00 00       	push   $0x3f8
  100e35:	e8 4e fe ff ff       	call   100c88 <inb>
  100e3a:	83 c4 04             	add    $0x4,%esp
  100e3d:	0f b6 c0             	movzbl %al,%eax
}
  100e40:	c9                   	leave
  100e41:	c3                   	ret

00100e42 <uartintr>:

void
uartintr(void)
{
  100e42:	55                   	push   %ebp
  100e43:	89 e5                	mov    %esp,%ebp
  100e45:	83 ec 08             	sub    $0x8,%esp
  consoleintr(uartgetc);
  100e48:	83 ec 0c             	sub    $0xc,%esp
  100e4b:	68 ff 0d 10 00       	push   $0x100dff
  100e50:	e8 2e f5 ff ff       	call   100383 <consoleintr>
  100e55:	83 c4 10             	add    $0x10,%esp
  100e58:	90                   	nop
  100e59:	c9                   	leave
  100e5a:	c3                   	ret

00100e5b <stosb>:
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
  100e5b:	55                   	push   %ebp
  100e5c:	89 e5                	mov    %esp,%ebp
  100e5e:	57                   	push   %edi
  100e5f:	53                   	push   %ebx
    while(n-- > 0)
  100e60:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e63:	8b 55 10             	mov    0x10(%ebp),%edx
  100e66:	8b 45 0c             	mov    0xc(%ebp),%eax
  100e69:	89 cb                	mov    %ecx,%ebx
  100e6b:	89 df                	mov    %ebx,%edi
  100e6d:	89 d1                	mov    %edx,%ecx
  100e6f:	fc                   	cld
  100e70:	f3 aa                	rep stos %al,%es:(%edi)
  100e72:	89 ca                	mov    %ecx,%edx
  100e74:	89 fb                	mov    %edi,%ebx
  100e76:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100e79:	89 55 10             	mov    %edx,0x10(%ebp)
      *d++ = *s++;

  return dst;
}
  100e7c:	90                   	nop
  100e7d:	5b                   	pop    %ebx
  100e7e:	5f                   	pop    %edi
  100e7f:	5d                   	pop    %ebp
  100e80:	c3                   	ret

00100e81 <stosl>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
  100e81:	55                   	push   %ebp
  100e82:	89 e5                	mov    %esp,%ebp
  100e84:	57                   	push   %edi
  100e85:	53                   	push   %ebx
{
  100e86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e89:	8b 55 10             	mov    0x10(%ebp),%edx
  100e8c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100e8f:	89 cb                	mov    %ecx,%ebx
  100e91:	89 df                	mov    %ebx,%edi
  100e93:	89 d1                	mov    %edx,%ecx
  100e95:	fc                   	cld
  100e96:	f3 ab                	rep stos %eax,%es:(%edi)
  100e98:	89 ca                	mov    %ecx,%edx
  100e9a:	89 fb                	mov    %edi,%ebx
  100e9c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100e9f:	89 55 10             	mov    %edx,0x10(%ebp)
  return memmove(dst, src, n);
}

int
  100ea2:	90                   	nop
  100ea3:	5b                   	pop    %ebx
  100ea4:	5f                   	pop    %edi
  100ea5:	5d                   	pop    %ebp
  100ea6:	c3                   	ret

00100ea7 <memset>:
{
  100ea7:	55                   	push   %ebp
  100ea8:	89 e5                	mov    %esp,%ebp
  if ((int)dst%4 == 0 && n%4 == 0){
  100eaa:	8b 45 08             	mov    0x8(%ebp),%eax
  100ead:	83 e0 03             	and    $0x3,%eax
  100eb0:	85 c0                	test   %eax,%eax
  100eb2:	75 43                	jne    100ef7 <memset+0x50>
  100eb4:	8b 45 10             	mov    0x10(%ebp),%eax
  100eb7:	83 e0 03             	and    $0x3,%eax
  100eba:	85 c0                	test   %eax,%eax
  100ebc:	75 39                	jne    100ef7 <memset+0x50>
    c &= 0xFF;
  100ebe:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  100ec5:	8b 45 10             	mov    0x10(%ebp),%eax
  100ec8:	c1 e8 02             	shr    $0x2,%eax
  100ecb:	89 c2                	mov    %eax,%edx
  100ecd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ed0:	c1 e0 18             	shl    $0x18,%eax
  100ed3:	89 c1                	mov    %eax,%ecx
  100ed5:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ed8:	c1 e0 10             	shl    $0x10,%eax
  100edb:	09 c1                	or     %eax,%ecx
  100edd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ee0:	c1 e0 08             	shl    $0x8,%eax
  100ee3:	09 c8                	or     %ecx,%eax
  100ee5:	0b 45 0c             	or     0xc(%ebp),%eax
  100ee8:	52                   	push   %edx
  100ee9:	50                   	push   %eax
  100eea:	ff 75 08             	push   0x8(%ebp)
  100eed:	e8 8f ff ff ff       	call   100e81 <stosl>
  100ef2:	83 c4 0c             	add    $0xc,%esp
  100ef5:	eb 12                	jmp    100f09 <memset+0x62>
    stosb(dst, c, n);
  100ef7:	8b 45 10             	mov    0x10(%ebp),%eax
  100efa:	50                   	push   %eax
  100efb:	ff 75 0c             	push   0xc(%ebp)
  100efe:	ff 75 08             	push   0x8(%ebp)
  100f01:	e8 55 ff ff ff       	call   100e5b <stosb>
  100f06:	83 c4 0c             	add    $0xc,%esp
  return dst;
  100f09:	8b 45 08             	mov    0x8(%ebp),%eax
}
  100f0c:	c9                   	leave
  100f0d:	c3                   	ret

00100f0e <memcmp>:
{
  100f0e:	55                   	push   %ebp
  100f0f:	89 e5                	mov    %esp,%ebp
  100f11:	83 ec 10             	sub    $0x10,%esp
  s1 = v1;
  100f14:	8b 45 08             	mov    0x8(%ebp),%eax
  100f17:	89 45 fc             	mov    %eax,-0x4(%ebp)
  s2 = v2;
  100f1a:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f1d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0){
  100f20:	eb 30                	jmp    100f52 <memcmp+0x44>
    if(*s1 != *s2)
  100f22:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f25:	0f b6 10             	movzbl (%eax),%edx
  100f28:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f2b:	0f b6 00             	movzbl (%eax),%eax
  100f2e:	38 c2                	cmp    %al,%dl
  100f30:	74 18                	je     100f4a <memcmp+0x3c>
      return *s1 - *s2;
  100f32:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f35:	0f b6 00             	movzbl (%eax),%eax
  100f38:	0f b6 d0             	movzbl %al,%edx
  100f3b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f3e:	0f b6 00             	movzbl (%eax),%eax
  100f41:	0f b6 c8             	movzbl %al,%ecx
  100f44:	89 d0                	mov    %edx,%eax
  100f46:	29 c8                	sub    %ecx,%eax
  100f48:	eb 1a                	jmp    100f64 <memcmp+0x56>
    s1++, s2++;
  100f4a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100f4e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  while(n-- > 0){
  100f52:	8b 45 10             	mov    0x10(%ebp),%eax
  100f55:	8d 50 ff             	lea    -0x1(%eax),%edx
  100f58:	89 55 10             	mov    %edx,0x10(%ebp)
  100f5b:	85 c0                	test   %eax,%eax
  100f5d:	75 c3                	jne    100f22 <memcmp+0x14>
  return 0;
  100f5f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100f64:	c9                   	leave
  100f65:	c3                   	ret

00100f66 <memmove>:
{
  100f66:	55                   	push   %ebp
  100f67:	89 e5                	mov    %esp,%ebp
  100f69:	83 ec 10             	sub    $0x10,%esp
  s = src;
  100f6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f6f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  d = dst;
  100f72:	8b 45 08             	mov    0x8(%ebp),%eax
  100f75:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if(s < d && s + n > d){
  100f78:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f7b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100f7e:	73 54                	jae    100fd4 <memmove+0x6e>
  100f80:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100f83:	8b 45 10             	mov    0x10(%ebp),%eax
  100f86:	01 d0                	add    %edx,%eax
  100f88:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  100f8b:	73 47                	jae    100fd4 <memmove+0x6e>
    s += n;
  100f8d:	8b 45 10             	mov    0x10(%ebp),%eax
  100f90:	01 45 fc             	add    %eax,-0x4(%ebp)
    d += n;
  100f93:	8b 45 10             	mov    0x10(%ebp),%eax
  100f96:	01 45 f8             	add    %eax,-0x8(%ebp)
    while(n-- > 0)
  100f99:	eb 13                	jmp    100fae <memmove+0x48>
      *--d = *--s;
  100f9b:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  100f9f:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
  100fa3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100fa6:	0f b6 10             	movzbl (%eax),%edx
  100fa9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100fac:	88 10                	mov    %dl,(%eax)
    while(n-- > 0)
  100fae:	8b 45 10             	mov    0x10(%ebp),%eax
  100fb1:	8d 50 ff             	lea    -0x1(%eax),%edx
  100fb4:	89 55 10             	mov    %edx,0x10(%ebp)
  100fb7:	85 c0                	test   %eax,%eax
  100fb9:	75 e0                	jne    100f9b <memmove+0x35>
  if(s < d && s + n > d){
  100fbb:	eb 24                	jmp    100fe1 <memmove+0x7b>
      *d++ = *s++;
  100fbd:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100fc0:	8d 42 01             	lea    0x1(%edx),%eax
  100fc3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100fc6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100fc9:	8d 48 01             	lea    0x1(%eax),%ecx
  100fcc:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  100fcf:	0f b6 12             	movzbl (%edx),%edx
  100fd2:	88 10                	mov    %dl,(%eax)
    while(n-- > 0)
  100fd4:	8b 45 10             	mov    0x10(%ebp),%eax
  100fd7:	8d 50 ff             	lea    -0x1(%eax),%edx
  100fda:	89 55 10             	mov    %edx,0x10(%ebp)
  100fdd:	85 c0                	test   %eax,%eax
  100fdf:	75 dc                	jne    100fbd <memmove+0x57>
  return dst;
  100fe1:	8b 45 08             	mov    0x8(%ebp),%eax
}
  100fe4:	c9                   	leave
  100fe5:	c3                   	ret

00100fe6 <memcpy>:
{
  100fe6:	55                   	push   %ebp
  100fe7:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
  100fe9:	ff 75 10             	push   0x10(%ebp)
  100fec:	ff 75 0c             	push   0xc(%ebp)
  100fef:	ff 75 08             	push   0x8(%ebp)
  100ff2:	e8 6f ff ff ff       	call   100f66 <memmove>
  100ff7:	83 c4 0c             	add    $0xc,%esp
}
  100ffa:	c9                   	leave
  100ffb:	c3                   	ret

00100ffc <strncmp>:
strncmp(const char *p, const char *q, uint n)
{
  100ffc:	55                   	push   %ebp
  100ffd:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
  100fff:	eb 0c                	jmp    10100d <strncmp+0x11>
    n--, p++, q++;
  101001:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  101005:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  101009:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(n > 0 && *p && *p == *q)
  10100d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  101011:	74 1a                	je     10102d <strncmp+0x31>
  101013:	8b 45 08             	mov    0x8(%ebp),%eax
  101016:	0f b6 00             	movzbl (%eax),%eax
  101019:	84 c0                	test   %al,%al
  10101b:	74 10                	je     10102d <strncmp+0x31>
  10101d:	8b 45 08             	mov    0x8(%ebp),%eax
  101020:	0f b6 10             	movzbl (%eax),%edx
  101023:	8b 45 0c             	mov    0xc(%ebp),%eax
  101026:	0f b6 00             	movzbl (%eax),%eax
  101029:	38 c2                	cmp    %al,%dl
  10102b:	74 d4                	je     101001 <strncmp+0x5>
  if(n == 0)
  10102d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  101031:	75 07                	jne    10103a <strncmp+0x3e>
    return 0;
  101033:	b8 00 00 00 00       	mov    $0x0,%eax
  101038:	eb 16                	jmp    101050 <strncmp+0x54>
  return (uchar)*p - (uchar)*q;
  10103a:	8b 45 08             	mov    0x8(%ebp),%eax
  10103d:	0f b6 00             	movzbl (%eax),%eax
  101040:	0f b6 d0             	movzbl %al,%edx
  101043:	8b 45 0c             	mov    0xc(%ebp),%eax
  101046:	0f b6 00             	movzbl (%eax),%eax
  101049:	0f b6 c8             	movzbl %al,%ecx
  10104c:	89 d0                	mov    %edx,%eax
  10104e:	29 c8                	sub    %ecx,%eax
}
  101050:	5d                   	pop    %ebp
  101051:	c3                   	ret

00101052 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
  101052:	55                   	push   %ebp
  101053:	89 e5                	mov    %esp,%ebp
  101055:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  101058:	8b 45 08             	mov    0x8(%ebp),%eax
  10105b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
  10105e:	90                   	nop
  10105f:	8b 45 10             	mov    0x10(%ebp),%eax
  101062:	8d 50 ff             	lea    -0x1(%eax),%edx
  101065:	89 55 10             	mov    %edx,0x10(%ebp)
  101068:	85 c0                	test   %eax,%eax
  10106a:	7e 2c                	jle    101098 <strncpy+0x46>
  10106c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10106f:	8d 42 01             	lea    0x1(%edx),%eax
  101072:	89 45 0c             	mov    %eax,0xc(%ebp)
  101075:	8b 45 08             	mov    0x8(%ebp),%eax
  101078:	8d 48 01             	lea    0x1(%eax),%ecx
  10107b:	89 4d 08             	mov    %ecx,0x8(%ebp)
  10107e:	0f b6 12             	movzbl (%edx),%edx
  101081:	88 10                	mov    %dl,(%eax)
  101083:	0f b6 00             	movzbl (%eax),%eax
  101086:	84 c0                	test   %al,%al
  101088:	75 d5                	jne    10105f <strncpy+0xd>
    ;
  while(n-- > 0)
  10108a:	eb 0c                	jmp    101098 <strncpy+0x46>
    *s++ = 0;
  10108c:	8b 45 08             	mov    0x8(%ebp),%eax
  10108f:	8d 50 01             	lea    0x1(%eax),%edx
  101092:	89 55 08             	mov    %edx,0x8(%ebp)
  101095:	c6 00 00             	movb   $0x0,(%eax)
  while(n-- > 0)
  101098:	8b 45 10             	mov    0x10(%ebp),%eax
  10109b:	8d 50 ff             	lea    -0x1(%eax),%edx
  10109e:	89 55 10             	mov    %edx,0x10(%ebp)
  1010a1:	85 c0                	test   %eax,%eax
  1010a3:	7f e7                	jg     10108c <strncpy+0x3a>
  return os;
  1010a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1010a8:	c9                   	leave
  1010a9:	c3                   	ret

001010aa <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
  1010aa:	55                   	push   %ebp
  1010ab:	89 e5                	mov    %esp,%ebp
  1010ad:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  1010b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  if(n <= 0)
  1010b6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1010ba:	7f 05                	jg     1010c1 <safestrcpy+0x17>
    return os;
  1010bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1010bf:	eb 32                	jmp    1010f3 <safestrcpy+0x49>
  while(--n > 0 && (*s++ = *t++) != 0)
  1010c1:	90                   	nop
  1010c2:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1010c6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1010ca:	7e 1e                	jle    1010ea <safestrcpy+0x40>
  1010cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  1010cf:	8d 42 01             	lea    0x1(%edx),%eax
  1010d2:	89 45 0c             	mov    %eax,0xc(%ebp)
  1010d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1010d8:	8d 48 01             	lea    0x1(%eax),%ecx
  1010db:	89 4d 08             	mov    %ecx,0x8(%ebp)
  1010de:	0f b6 12             	movzbl (%edx),%edx
  1010e1:	88 10                	mov    %dl,(%eax)
  1010e3:	0f b6 00             	movzbl (%eax),%eax
  1010e6:	84 c0                	test   %al,%al
  1010e8:	75 d8                	jne    1010c2 <safestrcpy+0x18>
    ;
  *s = 0;
  1010ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1010ed:	c6 00 00             	movb   $0x0,(%eax)
  return os;
  1010f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1010f3:	c9                   	leave
  1010f4:	c3                   	ret

001010f5 <strlen>:

int
strlen(const char *s)
{
  1010f5:	55                   	push   %ebp
  1010f6:	89 e5                	mov    %esp,%ebp
  1010f8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  1010fb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101102:	eb 04                	jmp    101108 <strlen+0x13>
  101104:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101108:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10110b:	8b 45 08             	mov    0x8(%ebp),%eax
  10110e:	01 d0                	add    %edx,%eax
  101110:	0f b6 00             	movzbl (%eax),%eax
  101113:	84 c0                	test   %al,%al
  101115:	75 ed                	jne    101104 <strlen+0xf>
    ;
  return n;
  101117:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10111a:	c9                   	leave
  10111b:	c3                   	ret

0010111c <readeflags>:
  10111c:	55                   	push   %ebp
  10111d:	89 e5                	mov    %esp,%ebp
  10111f:	83 ec 10             	sub    $0x10,%esp
  101122:	9c                   	pushf
  101123:	58                   	pop    %eax
  101124:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101127:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10112a:	c9                   	leave
  10112b:	c3                   	ret

0010112c <cpuid>:
cpuid() {
  10112c:	55                   	push   %ebp
  10112d:	89 e5                	mov    %esp,%ebp
  10112f:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
  101132:	e8 07 00 00 00       	call   10113e <mycpu>
  101137:	2d b8 54 10 00       	sub    $0x1054b8,%eax
}
  10113c:	c9                   	leave
  10113d:	c3                   	ret

0010113e <mycpu>:
{
  10113e:	55                   	push   %ebp
  10113f:	89 e5                	mov    %esp,%ebp
  101141:	83 ec 18             	sub    $0x18,%esp
  if(readeflags()&FL_IF)
  101144:	e8 d3 ff ff ff       	call   10111c <readeflags>
  101149:	25 00 02 00 00       	and    $0x200,%eax
  10114e:	85 c0                	test   %eax,%eax
  101150:	74 0d                	je     10115f <mycpu+0x21>
    panic("mycpu called with interrupts enabled\n");
  101152:	83 ec 0c             	sub    $0xc,%esp
  101155:	68 80 42 10 00       	push   $0x104280
  10115a:	e8 4e f1 ff ff       	call   1002ad <panic>
  apicid = lapicid();
  10115f:	e8 b0 f5 ff ff       	call   100714 <lapicid>
  101164:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for (i = 0; i < ncpu; ++i) {
  101167:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10116e:	eb 21                	jmp    101191 <mycpu+0x53>
    if (cpus[i].apicid == apicid)
  101170:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101173:	05 b8 54 10 00       	add    $0x1054b8,%eax
  101178:	0f b6 00             	movzbl (%eax),%eax
  10117b:	0f b6 c0             	movzbl %al,%eax
  10117e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  101181:	75 0a                	jne    10118d <mycpu+0x4f>
      return &cpus[i];
  101183:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101186:	05 b8 54 10 00       	add    $0x1054b8,%eax
  10118b:	eb 1b                	jmp    1011a8 <mycpu+0x6a>
  for (i = 0; i < ncpu; ++i) {
  10118d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101191:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  101196:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101199:	7c d5                	jl     101170 <mycpu+0x32>
  panic("unknown apicid\n");
  10119b:	83 ec 0c             	sub    $0xc,%esp
  10119e:	68 a6 42 10 00       	push   $0x1042a6
  1011a3:	e8 05 f1 ff ff       	call   1002ad <panic>
  1011a8:	c9                   	leave
  1011a9:	c3                   	ret

001011aa <getcallerpcs>:
// #include "memlayout.h"

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
  1011aa:	55                   	push   %ebp
  1011ab:	89 e5                	mov    %esp,%ebp
  1011ad:	83 ec 10             	sub    $0x10,%esp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  1011b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1011b3:	83 e8 08             	sub    $0x8,%eax
  1011b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for(i = 0; i < 10; i++){
  1011b9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1011c0:	eb 2f                	jmp    1011f1 <getcallerpcs+0x47>
    // if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
    if(ebp == 0 || ebp == (uint*)0xffffffff)
  1011c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1011c6:	74 4a                	je     101212 <getcallerpcs+0x68>
  1011c8:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  1011cc:	74 44                	je     101212 <getcallerpcs+0x68>
      break;
    pcs[i] = ebp[1];     // saved %eip
  1011ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1011d1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1011d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1011db:	01 c2                	add    %eax,%edx
  1011dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1011e0:	8b 40 04             	mov    0x4(%eax),%eax
  1011e3:	89 02                	mov    %eax,(%edx)
    ebp = (uint*)ebp[0]; // saved %ebp
  1011e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1011e8:	8b 00                	mov    (%eax),%eax
  1011ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for(i = 0; i < 10; i++){
  1011ed:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1011f1:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
  1011f5:	7e cb                	jle    1011c2 <getcallerpcs+0x18>
  }
  for(; i < 10; i++)
  1011f7:	eb 19                	jmp    101212 <getcallerpcs+0x68>
    pcs[i] = 0;
  1011f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1011fc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101203:	8b 45 0c             	mov    0xc(%ebp),%eax
  101206:	01 d0                	add    %edx,%eax
  101208:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
  10120e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  101212:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
  101216:	7e e1                	jle    1011f9 <getcallerpcs+0x4f>
  101218:	90                   	nop
  101219:	90                   	nop
  10121a:	c9                   	leave
  10121b:	c3                   	ret

0010121c <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushal
  10121c:	60                   	pusha
  
  # Call trap(tf), where tf=%esp
  pushl %esp
  10121d:	54                   	push   %esp
  call trap
  10121e:	e8 41 01 00 00       	call   101364 <trap>
  addl $4, %esp
  101223:	83 c4 04             	add    $0x4,%esp

00101226 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
  101226:	61                   	popa
  addl $0x8, %esp  # trapno and errcode
  101227:	83 c4 08             	add    $0x8,%esp
  iret
  10122a:	cf                   	iret

0010122b <lidt>:
  10122b:	55                   	push   %ebp
  10122c:	89 e5                	mov    %esp,%ebp
  10122e:	83 ec 10             	sub    $0x10,%esp
  101231:	8b 45 0c             	mov    0xc(%ebp),%eax
  101234:	83 e8 01             	sub    $0x1,%eax
  101237:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  10123b:	8b 45 08             	mov    0x8(%ebp),%eax
  10123e:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  101242:	8b 45 08             	mov    0x8(%ebp),%eax
  101245:	c1 e8 10             	shr    $0x10,%eax
  101248:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  10124c:	8d 45 fa             	lea    -0x6(%ebp),%eax
  10124f:	0f 01 18             	lidtl  (%eax)
  101252:	90                   	nop
  101253:	c9                   	leave
  101254:	c3                   	ret

00101255 <rcr2>:
  101255:	55                   	push   %ebp
  101256:	89 e5                	mov    %esp,%ebp
  101258:	83 ec 10             	sub    $0x10,%esp
  10125b:	0f 20 d0             	mov    %cr2,%eax
  10125e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101261:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101264:	c9                   	leave
  101265:	c3                   	ret

00101266 <tvinit>:
{
  101266:	55                   	push   %ebp
  101267:	89 e5                	mov    %esp,%ebp
  101269:	83 ec 10             	sub    $0x10,%esp
  for(i = 0; i < 256; i++)
  10126c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101273:	e9 c3 00 00 00       	jmp    10133b <tvinit+0xd5>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  101278:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10127b:	8b 04 85 11 50 10 00 	mov    0x105011(,%eax,4),%eax
  101282:	89 c2                	mov    %eax,%edx
  101284:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101287:	66 89 14 c5 e0 54 10 	mov    %dx,0x1054e0(,%eax,8)
  10128e:	00 
  10128f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101292:	66 c7 04 c5 e2 54 10 	movw   $0x8,0x1054e2(,%eax,8)
  101299:	00 08 00 
  10129c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10129f:	0f b6 14 c5 e4 54 10 	movzbl 0x1054e4(,%eax,8),%edx
  1012a6:	00 
  1012a7:	83 e2 e0             	and    $0xffffffe0,%edx
  1012aa:	88 14 c5 e4 54 10 00 	mov    %dl,0x1054e4(,%eax,8)
  1012b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1012b4:	0f b6 14 c5 e4 54 10 	movzbl 0x1054e4(,%eax,8),%edx
  1012bb:	00 
  1012bc:	83 e2 1f             	and    $0x1f,%edx
  1012bf:	88 14 c5 e4 54 10 00 	mov    %dl,0x1054e4(,%eax,8)
  1012c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1012c9:	0f b6 14 c5 e5 54 10 	movzbl 0x1054e5(,%eax,8),%edx
  1012d0:	00 
  1012d1:	83 e2 f0             	and    $0xfffffff0,%edx
  1012d4:	83 ca 0e             	or     $0xe,%edx
  1012d7:	88 14 c5 e5 54 10 00 	mov    %dl,0x1054e5(,%eax,8)
  1012de:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1012e1:	0f b6 14 c5 e5 54 10 	movzbl 0x1054e5(,%eax,8),%edx
  1012e8:	00 
  1012e9:	83 e2 ef             	and    $0xffffffef,%edx
  1012ec:	88 14 c5 e5 54 10 00 	mov    %dl,0x1054e5(,%eax,8)
  1012f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1012f6:	0f b6 14 c5 e5 54 10 	movzbl 0x1054e5(,%eax,8),%edx
  1012fd:	00 
  1012fe:	83 e2 9f             	and    $0xffffff9f,%edx
  101301:	88 14 c5 e5 54 10 00 	mov    %dl,0x1054e5(,%eax,8)
  101308:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10130b:	0f b6 14 c5 e5 54 10 	movzbl 0x1054e5(,%eax,8),%edx
  101312:	00 
  101313:	83 ca 80             	or     $0xffffff80,%edx
  101316:	88 14 c5 e5 54 10 00 	mov    %dl,0x1054e5(,%eax,8)
  10131d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101320:	8b 04 85 11 50 10 00 	mov    0x105011(,%eax,4),%eax
  101327:	c1 e8 10             	shr    $0x10,%eax
  10132a:	89 c2                	mov    %eax,%edx
  10132c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10132f:	66 89 14 c5 e6 54 10 	mov    %dx,0x1054e6(,%eax,8)
  101336:	00 
  for(i = 0; i < 256; i++)
  101337:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10133b:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101342:	0f 8e 30 ff ff ff    	jle    101278 <tvinit+0x12>
}
  101348:	90                   	nop
  101349:	90                   	nop
  10134a:	c9                   	leave
  10134b:	c3                   	ret

0010134c <idtinit>:
{
  10134c:	55                   	push   %ebp
  10134d:	89 e5                	mov    %esp,%ebp
  lidt(idt, sizeof(idt));
  10134f:	68 00 08 00 00       	push   $0x800
  101354:	68 e0 54 10 00       	push   $0x1054e0
  101359:	e8 cd fe ff ff       	call   10122b <lidt>
  10135e:	83 c4 08             	add    $0x8,%esp
}
  101361:	90                   	nop
  101362:	c9                   	leave
  101363:	c3                   	ret

00101364 <trap>:
{
  101364:	55                   	push   %ebp
  101365:	89 e5                	mov    %esp,%ebp
  101367:	56                   	push   %esi
  101368:	53                   	push   %ebx
  switch(tf->trapno){
  101369:	8b 45 08             	mov    0x8(%ebp),%eax
  10136c:	8b 40 20             	mov    0x20(%eax),%eax
  10136f:	83 e8 20             	sub    $0x20,%eax
  101372:	83 f8 1f             	cmp    $0x1f,%eax
  101375:	77 61                	ja     1013d8 <trap+0x74>
  101377:	8b 04 85 14 43 10 00 	mov    0x104314(,%eax,4),%eax
  10137e:	ff e0                	jmp    *%eax
    ticks++;
  101380:	a1 e0 5c 10 00       	mov    0x105ce0,%eax
  101385:	83 c0 01             	add    $0x1,%eax
  101388:	a3 e0 5c 10 00       	mov    %eax,0x105ce0
    lapiceoi();
  10138d:	e8 a4 f3 ff ff       	call   100736 <lapiceoi>
    break;
  101392:	eb 7d                	jmp    101411 <trap+0xad>
    ideintr();
  101394:	e8 d3 11 00 00       	call   10256c <ideintr>
    lapiceoi();
  101399:	e8 98 f3 ff ff       	call   100736 <lapiceoi>
    break;
  10139e:	eb 71                	jmp    101411 <trap+0xad>
    uartintr();
  1013a0:	e8 9d fa ff ff       	call   100e42 <uartintr>
    lapiceoi();
  1013a5:	e8 8c f3 ff ff       	call   100736 <lapiceoi>
    break;
  1013aa:	eb 65                	jmp    101411 <trap+0xad>
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
  1013ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1013af:	8b 70 28             	mov    0x28(%eax),%esi
            cpuid(), tf->cs, tf->eip);
  1013b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1013b5:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
  1013b9:	0f b7 d8             	movzwl %ax,%ebx
  1013bc:	e8 6b fd ff ff       	call   10112c <cpuid>
  1013c1:	56                   	push   %esi
  1013c2:	53                   	push   %ebx
  1013c3:	50                   	push   %eax
  1013c4:	68 b8 42 10 00       	push   $0x1042b8
  1013c9:	e8 1e ed ff ff       	call   1000ec <cprintf>
  1013ce:	83 c4 10             	add    $0x10,%esp
    lapiceoi();
  1013d1:	e8 60 f3 ff ff       	call   100736 <lapiceoi>
    break;
  1013d6:	eb 39                	jmp    101411 <trap+0xad>
    cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
  1013d8:	e8 78 fe ff ff       	call   101255 <rcr2>
  1013dd:	89 c3                	mov    %eax,%ebx
  1013df:	8b 45 08             	mov    0x8(%ebp),%eax
  1013e2:	8b 70 28             	mov    0x28(%eax),%esi
  1013e5:	e8 42 fd ff ff       	call   10112c <cpuid>
  1013ea:	8b 55 08             	mov    0x8(%ebp),%edx
  1013ed:	8b 52 20             	mov    0x20(%edx),%edx
  1013f0:	83 ec 0c             	sub    $0xc,%esp
  1013f3:	53                   	push   %ebx
  1013f4:	56                   	push   %esi
  1013f5:	50                   	push   %eax
  1013f6:	52                   	push   %edx
  1013f7:	68 dc 42 10 00       	push   $0x1042dc
  1013fc:	e8 eb ec ff ff       	call   1000ec <cprintf>
  101401:	83 c4 20             	add    $0x20,%esp
    panic("trap");
  101404:	83 ec 0c             	sub    $0xc,%esp
  101407:	68 0e 43 10 00       	push   $0x10430e
  10140c:	e8 9c ee ff ff       	call   1002ad <panic>
}
  101411:	90                   	nop
  101412:	8d 65 f8             	lea    -0x8(%ebp),%esp
  101415:	5b                   	pop    %ebx
  101416:	5e                   	pop    %esi
  101417:	5d                   	pop    %ebp
  101418:	c3                   	ret

00101419 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
  101419:	6a 00                	push   $0x0
  pushl $0
  10141b:	6a 00                	push   $0x0
  jmp alltraps
  10141d:	e9 fa fd ff ff       	jmp    10121c <alltraps>

00101422 <vector1>:
.globl vector1
vector1:
  pushl $0
  101422:	6a 00                	push   $0x0
  pushl $1
  101424:	6a 01                	push   $0x1
  jmp alltraps
  101426:	e9 f1 fd ff ff       	jmp    10121c <alltraps>

0010142b <vector2>:
.globl vector2
vector2:
  pushl $0
  10142b:	6a 00                	push   $0x0
  pushl $2
  10142d:	6a 02                	push   $0x2
  jmp alltraps
  10142f:	e9 e8 fd ff ff       	jmp    10121c <alltraps>

00101434 <vector3>:
.globl vector3
vector3:
  pushl $0
  101434:	6a 00                	push   $0x0
  pushl $3
  101436:	6a 03                	push   $0x3
  jmp alltraps
  101438:	e9 df fd ff ff       	jmp    10121c <alltraps>

0010143d <vector4>:
.globl vector4
vector4:
  pushl $0
  10143d:	6a 00                	push   $0x0
  pushl $4
  10143f:	6a 04                	push   $0x4
  jmp alltraps
  101441:	e9 d6 fd ff ff       	jmp    10121c <alltraps>

00101446 <vector5>:
.globl vector5
vector5:
  pushl $0
  101446:	6a 00                	push   $0x0
  pushl $5
  101448:	6a 05                	push   $0x5
  jmp alltraps
  10144a:	e9 cd fd ff ff       	jmp    10121c <alltraps>

0010144f <vector6>:
.globl vector6
vector6:
  pushl $0
  10144f:	6a 00                	push   $0x0
  pushl $6
  101451:	6a 06                	push   $0x6
  jmp alltraps
  101453:	e9 c4 fd ff ff       	jmp    10121c <alltraps>

00101458 <vector7>:
.globl vector7
vector7:
  pushl $0
  101458:	6a 00                	push   $0x0
  pushl $7
  10145a:	6a 07                	push   $0x7
  jmp alltraps
  10145c:	e9 bb fd ff ff       	jmp    10121c <alltraps>

00101461 <vector8>:
.globl vector8
vector8:
  pushl $8
  101461:	6a 08                	push   $0x8
  jmp alltraps
  101463:	e9 b4 fd ff ff       	jmp    10121c <alltraps>

00101468 <vector9>:
.globl vector9
vector9:
  pushl $0
  101468:	6a 00                	push   $0x0
  pushl $9
  10146a:	6a 09                	push   $0x9
  jmp alltraps
  10146c:	e9 ab fd ff ff       	jmp    10121c <alltraps>

00101471 <vector10>:
.globl vector10
vector10:
  pushl $10
  101471:	6a 0a                	push   $0xa
  jmp alltraps
  101473:	e9 a4 fd ff ff       	jmp    10121c <alltraps>

00101478 <vector11>:
.globl vector11
vector11:
  pushl $11
  101478:	6a 0b                	push   $0xb
  jmp alltraps
  10147a:	e9 9d fd ff ff       	jmp    10121c <alltraps>

0010147f <vector12>:
.globl vector12
vector12:
  pushl $12
  10147f:	6a 0c                	push   $0xc
  jmp alltraps
  101481:	e9 96 fd ff ff       	jmp    10121c <alltraps>

00101486 <vector13>:
.globl vector13
vector13:
  pushl $13
  101486:	6a 0d                	push   $0xd
  jmp alltraps
  101488:	e9 8f fd ff ff       	jmp    10121c <alltraps>

0010148d <vector14>:
.globl vector14
vector14:
  pushl $14
  10148d:	6a 0e                	push   $0xe
  jmp alltraps
  10148f:	e9 88 fd ff ff       	jmp    10121c <alltraps>

00101494 <vector15>:
.globl vector15
vector15:
  pushl $0
  101494:	6a 00                	push   $0x0
  pushl $15
  101496:	6a 0f                	push   $0xf
  jmp alltraps
  101498:	e9 7f fd ff ff       	jmp    10121c <alltraps>

0010149d <vector16>:
.globl vector16
vector16:
  pushl $0
  10149d:	6a 00                	push   $0x0
  pushl $16
  10149f:	6a 10                	push   $0x10
  jmp alltraps
  1014a1:	e9 76 fd ff ff       	jmp    10121c <alltraps>

001014a6 <vector17>:
.globl vector17
vector17:
  pushl $17
  1014a6:	6a 11                	push   $0x11
  jmp alltraps
  1014a8:	e9 6f fd ff ff       	jmp    10121c <alltraps>

001014ad <vector18>:
.globl vector18
vector18:
  pushl $0
  1014ad:	6a 00                	push   $0x0
  pushl $18
  1014af:	6a 12                	push   $0x12
  jmp alltraps
  1014b1:	e9 66 fd ff ff       	jmp    10121c <alltraps>

001014b6 <vector19>:
.globl vector19
vector19:
  pushl $0
  1014b6:	6a 00                	push   $0x0
  pushl $19
  1014b8:	6a 13                	push   $0x13
  jmp alltraps
  1014ba:	e9 5d fd ff ff       	jmp    10121c <alltraps>

001014bf <vector20>:
.globl vector20
vector20:
  pushl $0
  1014bf:	6a 00                	push   $0x0
  pushl $20
  1014c1:	6a 14                	push   $0x14
  jmp alltraps
  1014c3:	e9 54 fd ff ff       	jmp    10121c <alltraps>

001014c8 <vector21>:
.globl vector21
vector21:
  pushl $0
  1014c8:	6a 00                	push   $0x0
  pushl $21
  1014ca:	6a 15                	push   $0x15
  jmp alltraps
  1014cc:	e9 4b fd ff ff       	jmp    10121c <alltraps>

001014d1 <vector22>:
.globl vector22
vector22:
  pushl $0
  1014d1:	6a 00                	push   $0x0
  pushl $22
  1014d3:	6a 16                	push   $0x16
  jmp alltraps
  1014d5:	e9 42 fd ff ff       	jmp    10121c <alltraps>

001014da <vector23>:
.globl vector23
vector23:
  pushl $0
  1014da:	6a 00                	push   $0x0
  pushl $23
  1014dc:	6a 17                	push   $0x17
  jmp alltraps
  1014de:	e9 39 fd ff ff       	jmp    10121c <alltraps>

001014e3 <vector24>:
.globl vector24
vector24:
  pushl $0
  1014e3:	6a 00                	push   $0x0
  pushl $24
  1014e5:	6a 18                	push   $0x18
  jmp alltraps
  1014e7:	e9 30 fd ff ff       	jmp    10121c <alltraps>

001014ec <vector25>:
.globl vector25
vector25:
  pushl $0
  1014ec:	6a 00                	push   $0x0
  pushl $25
  1014ee:	6a 19                	push   $0x19
  jmp alltraps
  1014f0:	e9 27 fd ff ff       	jmp    10121c <alltraps>

001014f5 <vector26>:
.globl vector26
vector26:
  pushl $0
  1014f5:	6a 00                	push   $0x0
  pushl $26
  1014f7:	6a 1a                	push   $0x1a
  jmp alltraps
  1014f9:	e9 1e fd ff ff       	jmp    10121c <alltraps>

001014fe <vector27>:
.globl vector27
vector27:
  pushl $0
  1014fe:	6a 00                	push   $0x0
  pushl $27
  101500:	6a 1b                	push   $0x1b
  jmp alltraps
  101502:	e9 15 fd ff ff       	jmp    10121c <alltraps>

00101507 <vector28>:
.globl vector28
vector28:
  pushl $0
  101507:	6a 00                	push   $0x0
  pushl $28
  101509:	6a 1c                	push   $0x1c
  jmp alltraps
  10150b:	e9 0c fd ff ff       	jmp    10121c <alltraps>

00101510 <vector29>:
.globl vector29
vector29:
  pushl $0
  101510:	6a 00                	push   $0x0
  pushl $29
  101512:	6a 1d                	push   $0x1d
  jmp alltraps
  101514:	e9 03 fd ff ff       	jmp    10121c <alltraps>

00101519 <vector30>:
.globl vector30
vector30:
  pushl $0
  101519:	6a 00                	push   $0x0
  pushl $30
  10151b:	6a 1e                	push   $0x1e
  jmp alltraps
  10151d:	e9 fa fc ff ff       	jmp    10121c <alltraps>

00101522 <vector31>:
.globl vector31
vector31:
  pushl $0
  101522:	6a 00                	push   $0x0
  pushl $31
  101524:	6a 1f                	push   $0x1f
  jmp alltraps
  101526:	e9 f1 fc ff ff       	jmp    10121c <alltraps>

0010152b <vector32>:
.globl vector32
vector32:
  pushl $0
  10152b:	6a 00                	push   $0x0
  pushl $32
  10152d:	6a 20                	push   $0x20
  jmp alltraps
  10152f:	e9 e8 fc ff ff       	jmp    10121c <alltraps>

00101534 <vector33>:
.globl vector33
vector33:
  pushl $0
  101534:	6a 00                	push   $0x0
  pushl $33
  101536:	6a 21                	push   $0x21
  jmp alltraps
  101538:	e9 df fc ff ff       	jmp    10121c <alltraps>

0010153d <vector34>:
.globl vector34
vector34:
  pushl $0
  10153d:	6a 00                	push   $0x0
  pushl $34
  10153f:	6a 22                	push   $0x22
  jmp alltraps
  101541:	e9 d6 fc ff ff       	jmp    10121c <alltraps>

00101546 <vector35>:
.globl vector35
vector35:
  pushl $0
  101546:	6a 00                	push   $0x0
  pushl $35
  101548:	6a 23                	push   $0x23
  jmp alltraps
  10154a:	e9 cd fc ff ff       	jmp    10121c <alltraps>

0010154f <vector36>:
.globl vector36
vector36:
  pushl $0
  10154f:	6a 00                	push   $0x0
  pushl $36
  101551:	6a 24                	push   $0x24
  jmp alltraps
  101553:	e9 c4 fc ff ff       	jmp    10121c <alltraps>

00101558 <vector37>:
.globl vector37
vector37:
  pushl $0
  101558:	6a 00                	push   $0x0
  pushl $37
  10155a:	6a 25                	push   $0x25
  jmp alltraps
  10155c:	e9 bb fc ff ff       	jmp    10121c <alltraps>

00101561 <vector38>:
.globl vector38
vector38:
  pushl $0
  101561:	6a 00                	push   $0x0
  pushl $38
  101563:	6a 26                	push   $0x26
  jmp alltraps
  101565:	e9 b2 fc ff ff       	jmp    10121c <alltraps>

0010156a <vector39>:
.globl vector39
vector39:
  pushl $0
  10156a:	6a 00                	push   $0x0
  pushl $39
  10156c:	6a 27                	push   $0x27
  jmp alltraps
  10156e:	e9 a9 fc ff ff       	jmp    10121c <alltraps>

00101573 <vector40>:
.globl vector40
vector40:
  pushl $0
  101573:	6a 00                	push   $0x0
  pushl $40
  101575:	6a 28                	push   $0x28
  jmp alltraps
  101577:	e9 a0 fc ff ff       	jmp    10121c <alltraps>

0010157c <vector41>:
.globl vector41
vector41:
  pushl $0
  10157c:	6a 00                	push   $0x0
  pushl $41
  10157e:	6a 29                	push   $0x29
  jmp alltraps
  101580:	e9 97 fc ff ff       	jmp    10121c <alltraps>

00101585 <vector42>:
.globl vector42
vector42:
  pushl $0
  101585:	6a 00                	push   $0x0
  pushl $42
  101587:	6a 2a                	push   $0x2a
  jmp alltraps
  101589:	e9 8e fc ff ff       	jmp    10121c <alltraps>

0010158e <vector43>:
.globl vector43
vector43:
  pushl $0
  10158e:	6a 00                	push   $0x0
  pushl $43
  101590:	6a 2b                	push   $0x2b
  jmp alltraps
  101592:	e9 85 fc ff ff       	jmp    10121c <alltraps>

00101597 <vector44>:
.globl vector44
vector44:
  pushl $0
  101597:	6a 00                	push   $0x0
  pushl $44
  101599:	6a 2c                	push   $0x2c
  jmp alltraps
  10159b:	e9 7c fc ff ff       	jmp    10121c <alltraps>

001015a0 <vector45>:
.globl vector45
vector45:
  pushl $0
  1015a0:	6a 00                	push   $0x0
  pushl $45
  1015a2:	6a 2d                	push   $0x2d
  jmp alltraps
  1015a4:	e9 73 fc ff ff       	jmp    10121c <alltraps>

001015a9 <vector46>:
.globl vector46
vector46:
  pushl $0
  1015a9:	6a 00                	push   $0x0
  pushl $46
  1015ab:	6a 2e                	push   $0x2e
  jmp alltraps
  1015ad:	e9 6a fc ff ff       	jmp    10121c <alltraps>

001015b2 <vector47>:
.globl vector47
vector47:
  pushl $0
  1015b2:	6a 00                	push   $0x0
  pushl $47
  1015b4:	6a 2f                	push   $0x2f
  jmp alltraps
  1015b6:	e9 61 fc ff ff       	jmp    10121c <alltraps>

001015bb <vector48>:
.globl vector48
vector48:
  pushl $0
  1015bb:	6a 00                	push   $0x0
  pushl $48
  1015bd:	6a 30                	push   $0x30
  jmp alltraps
  1015bf:	e9 58 fc ff ff       	jmp    10121c <alltraps>

001015c4 <vector49>:
.globl vector49
vector49:
  pushl $0
  1015c4:	6a 00                	push   $0x0
  pushl $49
  1015c6:	6a 31                	push   $0x31
  jmp alltraps
  1015c8:	e9 4f fc ff ff       	jmp    10121c <alltraps>

001015cd <vector50>:
.globl vector50
vector50:
  pushl $0
  1015cd:	6a 00                	push   $0x0
  pushl $50
  1015cf:	6a 32                	push   $0x32
  jmp alltraps
  1015d1:	e9 46 fc ff ff       	jmp    10121c <alltraps>

001015d6 <vector51>:
.globl vector51
vector51:
  pushl $0
  1015d6:	6a 00                	push   $0x0
  pushl $51
  1015d8:	6a 33                	push   $0x33
  jmp alltraps
  1015da:	e9 3d fc ff ff       	jmp    10121c <alltraps>

001015df <vector52>:
.globl vector52
vector52:
  pushl $0
  1015df:	6a 00                	push   $0x0
  pushl $52
  1015e1:	6a 34                	push   $0x34
  jmp alltraps
  1015e3:	e9 34 fc ff ff       	jmp    10121c <alltraps>

001015e8 <vector53>:
.globl vector53
vector53:
  pushl $0
  1015e8:	6a 00                	push   $0x0
  pushl $53
  1015ea:	6a 35                	push   $0x35
  jmp alltraps
  1015ec:	e9 2b fc ff ff       	jmp    10121c <alltraps>

001015f1 <vector54>:
.globl vector54
vector54:
  pushl $0
  1015f1:	6a 00                	push   $0x0
  pushl $54
  1015f3:	6a 36                	push   $0x36
  jmp alltraps
  1015f5:	e9 22 fc ff ff       	jmp    10121c <alltraps>

001015fa <vector55>:
.globl vector55
vector55:
  pushl $0
  1015fa:	6a 00                	push   $0x0
  pushl $55
  1015fc:	6a 37                	push   $0x37
  jmp alltraps
  1015fe:	e9 19 fc ff ff       	jmp    10121c <alltraps>

00101603 <vector56>:
.globl vector56
vector56:
  pushl $0
  101603:	6a 00                	push   $0x0
  pushl $56
  101605:	6a 38                	push   $0x38
  jmp alltraps
  101607:	e9 10 fc ff ff       	jmp    10121c <alltraps>

0010160c <vector57>:
.globl vector57
vector57:
  pushl $0
  10160c:	6a 00                	push   $0x0
  pushl $57
  10160e:	6a 39                	push   $0x39
  jmp alltraps
  101610:	e9 07 fc ff ff       	jmp    10121c <alltraps>

00101615 <vector58>:
.globl vector58
vector58:
  pushl $0
  101615:	6a 00                	push   $0x0
  pushl $58
  101617:	6a 3a                	push   $0x3a
  jmp alltraps
  101619:	e9 fe fb ff ff       	jmp    10121c <alltraps>

0010161e <vector59>:
.globl vector59
vector59:
  pushl $0
  10161e:	6a 00                	push   $0x0
  pushl $59
  101620:	6a 3b                	push   $0x3b
  jmp alltraps
  101622:	e9 f5 fb ff ff       	jmp    10121c <alltraps>

00101627 <vector60>:
.globl vector60
vector60:
  pushl $0
  101627:	6a 00                	push   $0x0
  pushl $60
  101629:	6a 3c                	push   $0x3c
  jmp alltraps
  10162b:	e9 ec fb ff ff       	jmp    10121c <alltraps>

00101630 <vector61>:
.globl vector61
vector61:
  pushl $0
  101630:	6a 00                	push   $0x0
  pushl $61
  101632:	6a 3d                	push   $0x3d
  jmp alltraps
  101634:	e9 e3 fb ff ff       	jmp    10121c <alltraps>

00101639 <vector62>:
.globl vector62
vector62:
  pushl $0
  101639:	6a 00                	push   $0x0
  pushl $62
  10163b:	6a 3e                	push   $0x3e
  jmp alltraps
  10163d:	e9 da fb ff ff       	jmp    10121c <alltraps>

00101642 <vector63>:
.globl vector63
vector63:
  pushl $0
  101642:	6a 00                	push   $0x0
  pushl $63
  101644:	6a 3f                	push   $0x3f
  jmp alltraps
  101646:	e9 d1 fb ff ff       	jmp    10121c <alltraps>

0010164b <vector64>:
.globl vector64
vector64:
  pushl $0
  10164b:	6a 00                	push   $0x0
  pushl $64
  10164d:	6a 40                	push   $0x40
  jmp alltraps
  10164f:	e9 c8 fb ff ff       	jmp    10121c <alltraps>

00101654 <vector65>:
.globl vector65
vector65:
  pushl $0
  101654:	6a 00                	push   $0x0
  pushl $65
  101656:	6a 41                	push   $0x41
  jmp alltraps
  101658:	e9 bf fb ff ff       	jmp    10121c <alltraps>

0010165d <vector66>:
.globl vector66
vector66:
  pushl $0
  10165d:	6a 00                	push   $0x0
  pushl $66
  10165f:	6a 42                	push   $0x42
  jmp alltraps
  101661:	e9 b6 fb ff ff       	jmp    10121c <alltraps>

00101666 <vector67>:
.globl vector67
vector67:
  pushl $0
  101666:	6a 00                	push   $0x0
  pushl $67
  101668:	6a 43                	push   $0x43
  jmp alltraps
  10166a:	e9 ad fb ff ff       	jmp    10121c <alltraps>

0010166f <vector68>:
.globl vector68
vector68:
  pushl $0
  10166f:	6a 00                	push   $0x0
  pushl $68
  101671:	6a 44                	push   $0x44
  jmp alltraps
  101673:	e9 a4 fb ff ff       	jmp    10121c <alltraps>

00101678 <vector69>:
.globl vector69
vector69:
  pushl $0
  101678:	6a 00                	push   $0x0
  pushl $69
  10167a:	6a 45                	push   $0x45
  jmp alltraps
  10167c:	e9 9b fb ff ff       	jmp    10121c <alltraps>

00101681 <vector70>:
.globl vector70
vector70:
  pushl $0
  101681:	6a 00                	push   $0x0
  pushl $70
  101683:	6a 46                	push   $0x46
  jmp alltraps
  101685:	e9 92 fb ff ff       	jmp    10121c <alltraps>

0010168a <vector71>:
.globl vector71
vector71:
  pushl $0
  10168a:	6a 00                	push   $0x0
  pushl $71
  10168c:	6a 47                	push   $0x47
  jmp alltraps
  10168e:	e9 89 fb ff ff       	jmp    10121c <alltraps>

00101693 <vector72>:
.globl vector72
vector72:
  pushl $0
  101693:	6a 00                	push   $0x0
  pushl $72
  101695:	6a 48                	push   $0x48
  jmp alltraps
  101697:	e9 80 fb ff ff       	jmp    10121c <alltraps>

0010169c <vector73>:
.globl vector73
vector73:
  pushl $0
  10169c:	6a 00                	push   $0x0
  pushl $73
  10169e:	6a 49                	push   $0x49
  jmp alltraps
  1016a0:	e9 77 fb ff ff       	jmp    10121c <alltraps>

001016a5 <vector74>:
.globl vector74
vector74:
  pushl $0
  1016a5:	6a 00                	push   $0x0
  pushl $74
  1016a7:	6a 4a                	push   $0x4a
  jmp alltraps
  1016a9:	e9 6e fb ff ff       	jmp    10121c <alltraps>

001016ae <vector75>:
.globl vector75
vector75:
  pushl $0
  1016ae:	6a 00                	push   $0x0
  pushl $75
  1016b0:	6a 4b                	push   $0x4b
  jmp alltraps
  1016b2:	e9 65 fb ff ff       	jmp    10121c <alltraps>

001016b7 <vector76>:
.globl vector76
vector76:
  pushl $0
  1016b7:	6a 00                	push   $0x0
  pushl $76
  1016b9:	6a 4c                	push   $0x4c
  jmp alltraps
  1016bb:	e9 5c fb ff ff       	jmp    10121c <alltraps>

001016c0 <vector77>:
.globl vector77
vector77:
  pushl $0
  1016c0:	6a 00                	push   $0x0
  pushl $77
  1016c2:	6a 4d                	push   $0x4d
  jmp alltraps
  1016c4:	e9 53 fb ff ff       	jmp    10121c <alltraps>

001016c9 <vector78>:
.globl vector78
vector78:
  pushl $0
  1016c9:	6a 00                	push   $0x0
  pushl $78
  1016cb:	6a 4e                	push   $0x4e
  jmp alltraps
  1016cd:	e9 4a fb ff ff       	jmp    10121c <alltraps>

001016d2 <vector79>:
.globl vector79
vector79:
  pushl $0
  1016d2:	6a 00                	push   $0x0
  pushl $79
  1016d4:	6a 4f                	push   $0x4f
  jmp alltraps
  1016d6:	e9 41 fb ff ff       	jmp    10121c <alltraps>

001016db <vector80>:
.globl vector80
vector80:
  pushl $0
  1016db:	6a 00                	push   $0x0
  pushl $80
  1016dd:	6a 50                	push   $0x50
  jmp alltraps
  1016df:	e9 38 fb ff ff       	jmp    10121c <alltraps>

001016e4 <vector81>:
.globl vector81
vector81:
  pushl $0
  1016e4:	6a 00                	push   $0x0
  pushl $81
  1016e6:	6a 51                	push   $0x51
  jmp alltraps
  1016e8:	e9 2f fb ff ff       	jmp    10121c <alltraps>

001016ed <vector82>:
.globl vector82
vector82:
  pushl $0
  1016ed:	6a 00                	push   $0x0
  pushl $82
  1016ef:	6a 52                	push   $0x52
  jmp alltraps
  1016f1:	e9 26 fb ff ff       	jmp    10121c <alltraps>

001016f6 <vector83>:
.globl vector83
vector83:
  pushl $0
  1016f6:	6a 00                	push   $0x0
  pushl $83
  1016f8:	6a 53                	push   $0x53
  jmp alltraps
  1016fa:	e9 1d fb ff ff       	jmp    10121c <alltraps>

001016ff <vector84>:
.globl vector84
vector84:
  pushl $0
  1016ff:	6a 00                	push   $0x0
  pushl $84
  101701:	6a 54                	push   $0x54
  jmp alltraps
  101703:	e9 14 fb ff ff       	jmp    10121c <alltraps>

00101708 <vector85>:
.globl vector85
vector85:
  pushl $0
  101708:	6a 00                	push   $0x0
  pushl $85
  10170a:	6a 55                	push   $0x55
  jmp alltraps
  10170c:	e9 0b fb ff ff       	jmp    10121c <alltraps>

00101711 <vector86>:
.globl vector86
vector86:
  pushl $0
  101711:	6a 00                	push   $0x0
  pushl $86
  101713:	6a 56                	push   $0x56
  jmp alltraps
  101715:	e9 02 fb ff ff       	jmp    10121c <alltraps>

0010171a <vector87>:
.globl vector87
vector87:
  pushl $0
  10171a:	6a 00                	push   $0x0
  pushl $87
  10171c:	6a 57                	push   $0x57
  jmp alltraps
  10171e:	e9 f9 fa ff ff       	jmp    10121c <alltraps>

00101723 <vector88>:
.globl vector88
vector88:
  pushl $0
  101723:	6a 00                	push   $0x0
  pushl $88
  101725:	6a 58                	push   $0x58
  jmp alltraps
  101727:	e9 f0 fa ff ff       	jmp    10121c <alltraps>

0010172c <vector89>:
.globl vector89
vector89:
  pushl $0
  10172c:	6a 00                	push   $0x0
  pushl $89
  10172e:	6a 59                	push   $0x59
  jmp alltraps
  101730:	e9 e7 fa ff ff       	jmp    10121c <alltraps>

00101735 <vector90>:
.globl vector90
vector90:
  pushl $0
  101735:	6a 00                	push   $0x0
  pushl $90
  101737:	6a 5a                	push   $0x5a
  jmp alltraps
  101739:	e9 de fa ff ff       	jmp    10121c <alltraps>

0010173e <vector91>:
.globl vector91
vector91:
  pushl $0
  10173e:	6a 00                	push   $0x0
  pushl $91
  101740:	6a 5b                	push   $0x5b
  jmp alltraps
  101742:	e9 d5 fa ff ff       	jmp    10121c <alltraps>

00101747 <vector92>:
.globl vector92
vector92:
  pushl $0
  101747:	6a 00                	push   $0x0
  pushl $92
  101749:	6a 5c                	push   $0x5c
  jmp alltraps
  10174b:	e9 cc fa ff ff       	jmp    10121c <alltraps>

00101750 <vector93>:
.globl vector93
vector93:
  pushl $0
  101750:	6a 00                	push   $0x0
  pushl $93
  101752:	6a 5d                	push   $0x5d
  jmp alltraps
  101754:	e9 c3 fa ff ff       	jmp    10121c <alltraps>

00101759 <vector94>:
.globl vector94
vector94:
  pushl $0
  101759:	6a 00                	push   $0x0
  pushl $94
  10175b:	6a 5e                	push   $0x5e
  jmp alltraps
  10175d:	e9 ba fa ff ff       	jmp    10121c <alltraps>

00101762 <vector95>:
.globl vector95
vector95:
  pushl $0
  101762:	6a 00                	push   $0x0
  pushl $95
  101764:	6a 5f                	push   $0x5f
  jmp alltraps
  101766:	e9 b1 fa ff ff       	jmp    10121c <alltraps>

0010176b <vector96>:
.globl vector96
vector96:
  pushl $0
  10176b:	6a 00                	push   $0x0
  pushl $96
  10176d:	6a 60                	push   $0x60
  jmp alltraps
  10176f:	e9 a8 fa ff ff       	jmp    10121c <alltraps>

00101774 <vector97>:
.globl vector97
vector97:
  pushl $0
  101774:	6a 00                	push   $0x0
  pushl $97
  101776:	6a 61                	push   $0x61
  jmp alltraps
  101778:	e9 9f fa ff ff       	jmp    10121c <alltraps>

0010177d <vector98>:
.globl vector98
vector98:
  pushl $0
  10177d:	6a 00                	push   $0x0
  pushl $98
  10177f:	6a 62                	push   $0x62
  jmp alltraps
  101781:	e9 96 fa ff ff       	jmp    10121c <alltraps>

00101786 <vector99>:
.globl vector99
vector99:
  pushl $0
  101786:	6a 00                	push   $0x0
  pushl $99
  101788:	6a 63                	push   $0x63
  jmp alltraps
  10178a:	e9 8d fa ff ff       	jmp    10121c <alltraps>

0010178f <vector100>:
.globl vector100
vector100:
  pushl $0
  10178f:	6a 00                	push   $0x0
  pushl $100
  101791:	6a 64                	push   $0x64
  jmp alltraps
  101793:	e9 84 fa ff ff       	jmp    10121c <alltraps>

00101798 <vector101>:
.globl vector101
vector101:
  pushl $0
  101798:	6a 00                	push   $0x0
  pushl $101
  10179a:	6a 65                	push   $0x65
  jmp alltraps
  10179c:	e9 7b fa ff ff       	jmp    10121c <alltraps>

001017a1 <vector102>:
.globl vector102
vector102:
  pushl $0
  1017a1:	6a 00                	push   $0x0
  pushl $102
  1017a3:	6a 66                	push   $0x66
  jmp alltraps
  1017a5:	e9 72 fa ff ff       	jmp    10121c <alltraps>

001017aa <vector103>:
.globl vector103
vector103:
  pushl $0
  1017aa:	6a 00                	push   $0x0
  pushl $103
  1017ac:	6a 67                	push   $0x67
  jmp alltraps
  1017ae:	e9 69 fa ff ff       	jmp    10121c <alltraps>

001017b3 <vector104>:
.globl vector104
vector104:
  pushl $0
  1017b3:	6a 00                	push   $0x0
  pushl $104
  1017b5:	6a 68                	push   $0x68
  jmp alltraps
  1017b7:	e9 60 fa ff ff       	jmp    10121c <alltraps>

001017bc <vector105>:
.globl vector105
vector105:
  pushl $0
  1017bc:	6a 00                	push   $0x0
  pushl $105
  1017be:	6a 69                	push   $0x69
  jmp alltraps
  1017c0:	e9 57 fa ff ff       	jmp    10121c <alltraps>

001017c5 <vector106>:
.globl vector106
vector106:
  pushl $0
  1017c5:	6a 00                	push   $0x0
  pushl $106
  1017c7:	6a 6a                	push   $0x6a
  jmp alltraps
  1017c9:	e9 4e fa ff ff       	jmp    10121c <alltraps>

001017ce <vector107>:
.globl vector107
vector107:
  pushl $0
  1017ce:	6a 00                	push   $0x0
  pushl $107
  1017d0:	6a 6b                	push   $0x6b
  jmp alltraps
  1017d2:	e9 45 fa ff ff       	jmp    10121c <alltraps>

001017d7 <vector108>:
.globl vector108
vector108:
  pushl $0
  1017d7:	6a 00                	push   $0x0
  pushl $108
  1017d9:	6a 6c                	push   $0x6c
  jmp alltraps
  1017db:	e9 3c fa ff ff       	jmp    10121c <alltraps>

001017e0 <vector109>:
.globl vector109
vector109:
  pushl $0
  1017e0:	6a 00                	push   $0x0
  pushl $109
  1017e2:	6a 6d                	push   $0x6d
  jmp alltraps
  1017e4:	e9 33 fa ff ff       	jmp    10121c <alltraps>

001017e9 <vector110>:
.globl vector110
vector110:
  pushl $0
  1017e9:	6a 00                	push   $0x0
  pushl $110
  1017eb:	6a 6e                	push   $0x6e
  jmp alltraps
  1017ed:	e9 2a fa ff ff       	jmp    10121c <alltraps>

001017f2 <vector111>:
.globl vector111
vector111:
  pushl $0
  1017f2:	6a 00                	push   $0x0
  pushl $111
  1017f4:	6a 6f                	push   $0x6f
  jmp alltraps
  1017f6:	e9 21 fa ff ff       	jmp    10121c <alltraps>

001017fb <vector112>:
.globl vector112
vector112:
  pushl $0
  1017fb:	6a 00                	push   $0x0
  pushl $112
  1017fd:	6a 70                	push   $0x70
  jmp alltraps
  1017ff:	e9 18 fa ff ff       	jmp    10121c <alltraps>

00101804 <vector113>:
.globl vector113
vector113:
  pushl $0
  101804:	6a 00                	push   $0x0
  pushl $113
  101806:	6a 71                	push   $0x71
  jmp alltraps
  101808:	e9 0f fa ff ff       	jmp    10121c <alltraps>

0010180d <vector114>:
.globl vector114
vector114:
  pushl $0
  10180d:	6a 00                	push   $0x0
  pushl $114
  10180f:	6a 72                	push   $0x72
  jmp alltraps
  101811:	e9 06 fa ff ff       	jmp    10121c <alltraps>

00101816 <vector115>:
.globl vector115
vector115:
  pushl $0
  101816:	6a 00                	push   $0x0
  pushl $115
  101818:	6a 73                	push   $0x73
  jmp alltraps
  10181a:	e9 fd f9 ff ff       	jmp    10121c <alltraps>

0010181f <vector116>:
.globl vector116
vector116:
  pushl $0
  10181f:	6a 00                	push   $0x0
  pushl $116
  101821:	6a 74                	push   $0x74
  jmp alltraps
  101823:	e9 f4 f9 ff ff       	jmp    10121c <alltraps>

00101828 <vector117>:
.globl vector117
vector117:
  pushl $0
  101828:	6a 00                	push   $0x0
  pushl $117
  10182a:	6a 75                	push   $0x75
  jmp alltraps
  10182c:	e9 eb f9 ff ff       	jmp    10121c <alltraps>

00101831 <vector118>:
.globl vector118
vector118:
  pushl $0
  101831:	6a 00                	push   $0x0
  pushl $118
  101833:	6a 76                	push   $0x76
  jmp alltraps
  101835:	e9 e2 f9 ff ff       	jmp    10121c <alltraps>

0010183a <vector119>:
.globl vector119
vector119:
  pushl $0
  10183a:	6a 00                	push   $0x0
  pushl $119
  10183c:	6a 77                	push   $0x77
  jmp alltraps
  10183e:	e9 d9 f9 ff ff       	jmp    10121c <alltraps>

00101843 <vector120>:
.globl vector120
vector120:
  pushl $0
  101843:	6a 00                	push   $0x0
  pushl $120
  101845:	6a 78                	push   $0x78
  jmp alltraps
  101847:	e9 d0 f9 ff ff       	jmp    10121c <alltraps>

0010184c <vector121>:
.globl vector121
vector121:
  pushl $0
  10184c:	6a 00                	push   $0x0
  pushl $121
  10184e:	6a 79                	push   $0x79
  jmp alltraps
  101850:	e9 c7 f9 ff ff       	jmp    10121c <alltraps>

00101855 <vector122>:
.globl vector122
vector122:
  pushl $0
  101855:	6a 00                	push   $0x0
  pushl $122
  101857:	6a 7a                	push   $0x7a
  jmp alltraps
  101859:	e9 be f9 ff ff       	jmp    10121c <alltraps>

0010185e <vector123>:
.globl vector123
vector123:
  pushl $0
  10185e:	6a 00                	push   $0x0
  pushl $123
  101860:	6a 7b                	push   $0x7b
  jmp alltraps
  101862:	e9 b5 f9 ff ff       	jmp    10121c <alltraps>

00101867 <vector124>:
.globl vector124
vector124:
  pushl $0
  101867:	6a 00                	push   $0x0
  pushl $124
  101869:	6a 7c                	push   $0x7c
  jmp alltraps
  10186b:	e9 ac f9 ff ff       	jmp    10121c <alltraps>

00101870 <vector125>:
.globl vector125
vector125:
  pushl $0
  101870:	6a 00                	push   $0x0
  pushl $125
  101872:	6a 7d                	push   $0x7d
  jmp alltraps
  101874:	e9 a3 f9 ff ff       	jmp    10121c <alltraps>

00101879 <vector126>:
.globl vector126
vector126:
  pushl $0
  101879:	6a 00                	push   $0x0
  pushl $126
  10187b:	6a 7e                	push   $0x7e
  jmp alltraps
  10187d:	e9 9a f9 ff ff       	jmp    10121c <alltraps>

00101882 <vector127>:
.globl vector127
vector127:
  pushl $0
  101882:	6a 00                	push   $0x0
  pushl $127
  101884:	6a 7f                	push   $0x7f
  jmp alltraps
  101886:	e9 91 f9 ff ff       	jmp    10121c <alltraps>

0010188b <vector128>:
.globl vector128
vector128:
  pushl $0
  10188b:	6a 00                	push   $0x0
  pushl $128
  10188d:	68 80 00 00 00       	push   $0x80
  jmp alltraps
  101892:	e9 85 f9 ff ff       	jmp    10121c <alltraps>

00101897 <vector129>:
.globl vector129
vector129:
  pushl $0
  101897:	6a 00                	push   $0x0
  pushl $129
  101899:	68 81 00 00 00       	push   $0x81
  jmp alltraps
  10189e:	e9 79 f9 ff ff       	jmp    10121c <alltraps>

001018a3 <vector130>:
.globl vector130
vector130:
  pushl $0
  1018a3:	6a 00                	push   $0x0
  pushl $130
  1018a5:	68 82 00 00 00       	push   $0x82
  jmp alltraps
  1018aa:	e9 6d f9 ff ff       	jmp    10121c <alltraps>

001018af <vector131>:
.globl vector131
vector131:
  pushl $0
  1018af:	6a 00                	push   $0x0
  pushl $131
  1018b1:	68 83 00 00 00       	push   $0x83
  jmp alltraps
  1018b6:	e9 61 f9 ff ff       	jmp    10121c <alltraps>

001018bb <vector132>:
.globl vector132
vector132:
  pushl $0
  1018bb:	6a 00                	push   $0x0
  pushl $132
  1018bd:	68 84 00 00 00       	push   $0x84
  jmp alltraps
  1018c2:	e9 55 f9 ff ff       	jmp    10121c <alltraps>

001018c7 <vector133>:
.globl vector133
vector133:
  pushl $0
  1018c7:	6a 00                	push   $0x0
  pushl $133
  1018c9:	68 85 00 00 00       	push   $0x85
  jmp alltraps
  1018ce:	e9 49 f9 ff ff       	jmp    10121c <alltraps>

001018d3 <vector134>:
.globl vector134
vector134:
  pushl $0
  1018d3:	6a 00                	push   $0x0
  pushl $134
  1018d5:	68 86 00 00 00       	push   $0x86
  jmp alltraps
  1018da:	e9 3d f9 ff ff       	jmp    10121c <alltraps>

001018df <vector135>:
.globl vector135
vector135:
  pushl $0
  1018df:	6a 00                	push   $0x0
  pushl $135
  1018e1:	68 87 00 00 00       	push   $0x87
  jmp alltraps
  1018e6:	e9 31 f9 ff ff       	jmp    10121c <alltraps>

001018eb <vector136>:
.globl vector136
vector136:
  pushl $0
  1018eb:	6a 00                	push   $0x0
  pushl $136
  1018ed:	68 88 00 00 00       	push   $0x88
  jmp alltraps
  1018f2:	e9 25 f9 ff ff       	jmp    10121c <alltraps>

001018f7 <vector137>:
.globl vector137
vector137:
  pushl $0
  1018f7:	6a 00                	push   $0x0
  pushl $137
  1018f9:	68 89 00 00 00       	push   $0x89
  jmp alltraps
  1018fe:	e9 19 f9 ff ff       	jmp    10121c <alltraps>

00101903 <vector138>:
.globl vector138
vector138:
  pushl $0
  101903:	6a 00                	push   $0x0
  pushl $138
  101905:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
  10190a:	e9 0d f9 ff ff       	jmp    10121c <alltraps>

0010190f <vector139>:
.globl vector139
vector139:
  pushl $0
  10190f:	6a 00                	push   $0x0
  pushl $139
  101911:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
  101916:	e9 01 f9 ff ff       	jmp    10121c <alltraps>

0010191b <vector140>:
.globl vector140
vector140:
  pushl $0
  10191b:	6a 00                	push   $0x0
  pushl $140
  10191d:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
  101922:	e9 f5 f8 ff ff       	jmp    10121c <alltraps>

00101927 <vector141>:
.globl vector141
vector141:
  pushl $0
  101927:	6a 00                	push   $0x0
  pushl $141
  101929:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
  10192e:	e9 e9 f8 ff ff       	jmp    10121c <alltraps>

00101933 <vector142>:
.globl vector142
vector142:
  pushl $0
  101933:	6a 00                	push   $0x0
  pushl $142
  101935:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
  10193a:	e9 dd f8 ff ff       	jmp    10121c <alltraps>

0010193f <vector143>:
.globl vector143
vector143:
  pushl $0
  10193f:	6a 00                	push   $0x0
  pushl $143
  101941:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
  101946:	e9 d1 f8 ff ff       	jmp    10121c <alltraps>

0010194b <vector144>:
.globl vector144
vector144:
  pushl $0
  10194b:	6a 00                	push   $0x0
  pushl $144
  10194d:	68 90 00 00 00       	push   $0x90
  jmp alltraps
  101952:	e9 c5 f8 ff ff       	jmp    10121c <alltraps>

00101957 <vector145>:
.globl vector145
vector145:
  pushl $0
  101957:	6a 00                	push   $0x0
  pushl $145
  101959:	68 91 00 00 00       	push   $0x91
  jmp alltraps
  10195e:	e9 b9 f8 ff ff       	jmp    10121c <alltraps>

00101963 <vector146>:
.globl vector146
vector146:
  pushl $0
  101963:	6a 00                	push   $0x0
  pushl $146
  101965:	68 92 00 00 00       	push   $0x92
  jmp alltraps
  10196a:	e9 ad f8 ff ff       	jmp    10121c <alltraps>

0010196f <vector147>:
.globl vector147
vector147:
  pushl $0
  10196f:	6a 00                	push   $0x0
  pushl $147
  101971:	68 93 00 00 00       	push   $0x93
  jmp alltraps
  101976:	e9 a1 f8 ff ff       	jmp    10121c <alltraps>

0010197b <vector148>:
.globl vector148
vector148:
  pushl $0
  10197b:	6a 00                	push   $0x0
  pushl $148
  10197d:	68 94 00 00 00       	push   $0x94
  jmp alltraps
  101982:	e9 95 f8 ff ff       	jmp    10121c <alltraps>

00101987 <vector149>:
.globl vector149
vector149:
  pushl $0
  101987:	6a 00                	push   $0x0
  pushl $149
  101989:	68 95 00 00 00       	push   $0x95
  jmp alltraps
  10198e:	e9 89 f8 ff ff       	jmp    10121c <alltraps>

00101993 <vector150>:
.globl vector150
vector150:
  pushl $0
  101993:	6a 00                	push   $0x0
  pushl $150
  101995:	68 96 00 00 00       	push   $0x96
  jmp alltraps
  10199a:	e9 7d f8 ff ff       	jmp    10121c <alltraps>

0010199f <vector151>:
.globl vector151
vector151:
  pushl $0
  10199f:	6a 00                	push   $0x0
  pushl $151
  1019a1:	68 97 00 00 00       	push   $0x97
  jmp alltraps
  1019a6:	e9 71 f8 ff ff       	jmp    10121c <alltraps>

001019ab <vector152>:
.globl vector152
vector152:
  pushl $0
  1019ab:	6a 00                	push   $0x0
  pushl $152
  1019ad:	68 98 00 00 00       	push   $0x98
  jmp alltraps
  1019b2:	e9 65 f8 ff ff       	jmp    10121c <alltraps>

001019b7 <vector153>:
.globl vector153
vector153:
  pushl $0
  1019b7:	6a 00                	push   $0x0
  pushl $153
  1019b9:	68 99 00 00 00       	push   $0x99
  jmp alltraps
  1019be:	e9 59 f8 ff ff       	jmp    10121c <alltraps>

001019c3 <vector154>:
.globl vector154
vector154:
  pushl $0
  1019c3:	6a 00                	push   $0x0
  pushl $154
  1019c5:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
  1019ca:	e9 4d f8 ff ff       	jmp    10121c <alltraps>

001019cf <vector155>:
.globl vector155
vector155:
  pushl $0
  1019cf:	6a 00                	push   $0x0
  pushl $155
  1019d1:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
  1019d6:	e9 41 f8 ff ff       	jmp    10121c <alltraps>

001019db <vector156>:
.globl vector156
vector156:
  pushl $0
  1019db:	6a 00                	push   $0x0
  pushl $156
  1019dd:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
  1019e2:	e9 35 f8 ff ff       	jmp    10121c <alltraps>

001019e7 <vector157>:
.globl vector157
vector157:
  pushl $0
  1019e7:	6a 00                	push   $0x0
  pushl $157
  1019e9:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
  1019ee:	e9 29 f8 ff ff       	jmp    10121c <alltraps>

001019f3 <vector158>:
.globl vector158
vector158:
  pushl $0
  1019f3:	6a 00                	push   $0x0
  pushl $158
  1019f5:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
  1019fa:	e9 1d f8 ff ff       	jmp    10121c <alltraps>

001019ff <vector159>:
.globl vector159
vector159:
  pushl $0
  1019ff:	6a 00                	push   $0x0
  pushl $159
  101a01:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
  101a06:	e9 11 f8 ff ff       	jmp    10121c <alltraps>

00101a0b <vector160>:
.globl vector160
vector160:
  pushl $0
  101a0b:	6a 00                	push   $0x0
  pushl $160
  101a0d:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
  101a12:	e9 05 f8 ff ff       	jmp    10121c <alltraps>

00101a17 <vector161>:
.globl vector161
vector161:
  pushl $0
  101a17:	6a 00                	push   $0x0
  pushl $161
  101a19:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
  101a1e:	e9 f9 f7 ff ff       	jmp    10121c <alltraps>

00101a23 <vector162>:
.globl vector162
vector162:
  pushl $0
  101a23:	6a 00                	push   $0x0
  pushl $162
  101a25:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
  101a2a:	e9 ed f7 ff ff       	jmp    10121c <alltraps>

00101a2f <vector163>:
.globl vector163
vector163:
  pushl $0
  101a2f:	6a 00                	push   $0x0
  pushl $163
  101a31:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
  101a36:	e9 e1 f7 ff ff       	jmp    10121c <alltraps>

00101a3b <vector164>:
.globl vector164
vector164:
  pushl $0
  101a3b:	6a 00                	push   $0x0
  pushl $164
  101a3d:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
  101a42:	e9 d5 f7 ff ff       	jmp    10121c <alltraps>

00101a47 <vector165>:
.globl vector165
vector165:
  pushl $0
  101a47:	6a 00                	push   $0x0
  pushl $165
  101a49:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
  101a4e:	e9 c9 f7 ff ff       	jmp    10121c <alltraps>

00101a53 <vector166>:
.globl vector166
vector166:
  pushl $0
  101a53:	6a 00                	push   $0x0
  pushl $166
  101a55:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
  101a5a:	e9 bd f7 ff ff       	jmp    10121c <alltraps>

00101a5f <vector167>:
.globl vector167
vector167:
  pushl $0
  101a5f:	6a 00                	push   $0x0
  pushl $167
  101a61:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
  101a66:	e9 b1 f7 ff ff       	jmp    10121c <alltraps>

00101a6b <vector168>:
.globl vector168
vector168:
  pushl $0
  101a6b:	6a 00                	push   $0x0
  pushl $168
  101a6d:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
  101a72:	e9 a5 f7 ff ff       	jmp    10121c <alltraps>

00101a77 <vector169>:
.globl vector169
vector169:
  pushl $0
  101a77:	6a 00                	push   $0x0
  pushl $169
  101a79:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
  101a7e:	e9 99 f7 ff ff       	jmp    10121c <alltraps>

00101a83 <vector170>:
.globl vector170
vector170:
  pushl $0
  101a83:	6a 00                	push   $0x0
  pushl $170
  101a85:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
  101a8a:	e9 8d f7 ff ff       	jmp    10121c <alltraps>

00101a8f <vector171>:
.globl vector171
vector171:
  pushl $0
  101a8f:	6a 00                	push   $0x0
  pushl $171
  101a91:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
  101a96:	e9 81 f7 ff ff       	jmp    10121c <alltraps>

00101a9b <vector172>:
.globl vector172
vector172:
  pushl $0
  101a9b:	6a 00                	push   $0x0
  pushl $172
  101a9d:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
  101aa2:	e9 75 f7 ff ff       	jmp    10121c <alltraps>

00101aa7 <vector173>:
.globl vector173
vector173:
  pushl $0
  101aa7:	6a 00                	push   $0x0
  pushl $173
  101aa9:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
  101aae:	e9 69 f7 ff ff       	jmp    10121c <alltraps>

00101ab3 <vector174>:
.globl vector174
vector174:
  pushl $0
  101ab3:	6a 00                	push   $0x0
  pushl $174
  101ab5:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
  101aba:	e9 5d f7 ff ff       	jmp    10121c <alltraps>

00101abf <vector175>:
.globl vector175
vector175:
  pushl $0
  101abf:	6a 00                	push   $0x0
  pushl $175
  101ac1:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
  101ac6:	e9 51 f7 ff ff       	jmp    10121c <alltraps>

00101acb <vector176>:
.globl vector176
vector176:
  pushl $0
  101acb:	6a 00                	push   $0x0
  pushl $176
  101acd:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
  101ad2:	e9 45 f7 ff ff       	jmp    10121c <alltraps>

00101ad7 <vector177>:
.globl vector177
vector177:
  pushl $0
  101ad7:	6a 00                	push   $0x0
  pushl $177
  101ad9:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
  101ade:	e9 39 f7 ff ff       	jmp    10121c <alltraps>

00101ae3 <vector178>:
.globl vector178
vector178:
  pushl $0
  101ae3:	6a 00                	push   $0x0
  pushl $178
  101ae5:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
  101aea:	e9 2d f7 ff ff       	jmp    10121c <alltraps>

00101aef <vector179>:
.globl vector179
vector179:
  pushl $0
  101aef:	6a 00                	push   $0x0
  pushl $179
  101af1:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
  101af6:	e9 21 f7 ff ff       	jmp    10121c <alltraps>

00101afb <vector180>:
.globl vector180
vector180:
  pushl $0
  101afb:	6a 00                	push   $0x0
  pushl $180
  101afd:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
  101b02:	e9 15 f7 ff ff       	jmp    10121c <alltraps>

00101b07 <vector181>:
.globl vector181
vector181:
  pushl $0
  101b07:	6a 00                	push   $0x0
  pushl $181
  101b09:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
  101b0e:	e9 09 f7 ff ff       	jmp    10121c <alltraps>

00101b13 <vector182>:
.globl vector182
vector182:
  pushl $0
  101b13:	6a 00                	push   $0x0
  pushl $182
  101b15:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
  101b1a:	e9 fd f6 ff ff       	jmp    10121c <alltraps>

00101b1f <vector183>:
.globl vector183
vector183:
  pushl $0
  101b1f:	6a 00                	push   $0x0
  pushl $183
  101b21:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
  101b26:	e9 f1 f6 ff ff       	jmp    10121c <alltraps>

00101b2b <vector184>:
.globl vector184
vector184:
  pushl $0
  101b2b:	6a 00                	push   $0x0
  pushl $184
  101b2d:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
  101b32:	e9 e5 f6 ff ff       	jmp    10121c <alltraps>

00101b37 <vector185>:
.globl vector185
vector185:
  pushl $0
  101b37:	6a 00                	push   $0x0
  pushl $185
  101b39:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
  101b3e:	e9 d9 f6 ff ff       	jmp    10121c <alltraps>

00101b43 <vector186>:
.globl vector186
vector186:
  pushl $0
  101b43:	6a 00                	push   $0x0
  pushl $186
  101b45:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
  101b4a:	e9 cd f6 ff ff       	jmp    10121c <alltraps>

00101b4f <vector187>:
.globl vector187
vector187:
  pushl $0
  101b4f:	6a 00                	push   $0x0
  pushl $187
  101b51:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
  101b56:	e9 c1 f6 ff ff       	jmp    10121c <alltraps>

00101b5b <vector188>:
.globl vector188
vector188:
  pushl $0
  101b5b:	6a 00                	push   $0x0
  pushl $188
  101b5d:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
  101b62:	e9 b5 f6 ff ff       	jmp    10121c <alltraps>

00101b67 <vector189>:
.globl vector189
vector189:
  pushl $0
  101b67:	6a 00                	push   $0x0
  pushl $189
  101b69:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
  101b6e:	e9 a9 f6 ff ff       	jmp    10121c <alltraps>

00101b73 <vector190>:
.globl vector190
vector190:
  pushl $0
  101b73:	6a 00                	push   $0x0
  pushl $190
  101b75:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
  101b7a:	e9 9d f6 ff ff       	jmp    10121c <alltraps>

00101b7f <vector191>:
.globl vector191
vector191:
  pushl $0
  101b7f:	6a 00                	push   $0x0
  pushl $191
  101b81:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
  101b86:	e9 91 f6 ff ff       	jmp    10121c <alltraps>

00101b8b <vector192>:
.globl vector192
vector192:
  pushl $0
  101b8b:	6a 00                	push   $0x0
  pushl $192
  101b8d:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
  101b92:	e9 85 f6 ff ff       	jmp    10121c <alltraps>

00101b97 <vector193>:
.globl vector193
vector193:
  pushl $0
  101b97:	6a 00                	push   $0x0
  pushl $193
  101b99:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
  101b9e:	e9 79 f6 ff ff       	jmp    10121c <alltraps>

00101ba3 <vector194>:
.globl vector194
vector194:
  pushl $0
  101ba3:	6a 00                	push   $0x0
  pushl $194
  101ba5:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
  101baa:	e9 6d f6 ff ff       	jmp    10121c <alltraps>

00101baf <vector195>:
.globl vector195
vector195:
  pushl $0
  101baf:	6a 00                	push   $0x0
  pushl $195
  101bb1:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
  101bb6:	e9 61 f6 ff ff       	jmp    10121c <alltraps>

00101bbb <vector196>:
.globl vector196
vector196:
  pushl $0
  101bbb:	6a 00                	push   $0x0
  pushl $196
  101bbd:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
  101bc2:	e9 55 f6 ff ff       	jmp    10121c <alltraps>

00101bc7 <vector197>:
.globl vector197
vector197:
  pushl $0
  101bc7:	6a 00                	push   $0x0
  pushl $197
  101bc9:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
  101bce:	e9 49 f6 ff ff       	jmp    10121c <alltraps>

00101bd3 <vector198>:
.globl vector198
vector198:
  pushl $0
  101bd3:	6a 00                	push   $0x0
  pushl $198
  101bd5:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
  101bda:	e9 3d f6 ff ff       	jmp    10121c <alltraps>

00101bdf <vector199>:
.globl vector199
vector199:
  pushl $0
  101bdf:	6a 00                	push   $0x0
  pushl $199
  101be1:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
  101be6:	e9 31 f6 ff ff       	jmp    10121c <alltraps>

00101beb <vector200>:
.globl vector200
vector200:
  pushl $0
  101beb:	6a 00                	push   $0x0
  pushl $200
  101bed:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
  101bf2:	e9 25 f6 ff ff       	jmp    10121c <alltraps>

00101bf7 <vector201>:
.globl vector201
vector201:
  pushl $0
  101bf7:	6a 00                	push   $0x0
  pushl $201
  101bf9:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
  101bfe:	e9 19 f6 ff ff       	jmp    10121c <alltraps>

00101c03 <vector202>:
.globl vector202
vector202:
  pushl $0
  101c03:	6a 00                	push   $0x0
  pushl $202
  101c05:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
  101c0a:	e9 0d f6 ff ff       	jmp    10121c <alltraps>

00101c0f <vector203>:
.globl vector203
vector203:
  pushl $0
  101c0f:	6a 00                	push   $0x0
  pushl $203
  101c11:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
  101c16:	e9 01 f6 ff ff       	jmp    10121c <alltraps>

00101c1b <vector204>:
.globl vector204
vector204:
  pushl $0
  101c1b:	6a 00                	push   $0x0
  pushl $204
  101c1d:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
  101c22:	e9 f5 f5 ff ff       	jmp    10121c <alltraps>

00101c27 <vector205>:
.globl vector205
vector205:
  pushl $0
  101c27:	6a 00                	push   $0x0
  pushl $205
  101c29:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
  101c2e:	e9 e9 f5 ff ff       	jmp    10121c <alltraps>

00101c33 <vector206>:
.globl vector206
vector206:
  pushl $0
  101c33:	6a 00                	push   $0x0
  pushl $206
  101c35:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
  101c3a:	e9 dd f5 ff ff       	jmp    10121c <alltraps>

00101c3f <vector207>:
.globl vector207
vector207:
  pushl $0
  101c3f:	6a 00                	push   $0x0
  pushl $207
  101c41:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
  101c46:	e9 d1 f5 ff ff       	jmp    10121c <alltraps>

00101c4b <vector208>:
.globl vector208
vector208:
  pushl $0
  101c4b:	6a 00                	push   $0x0
  pushl $208
  101c4d:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
  101c52:	e9 c5 f5 ff ff       	jmp    10121c <alltraps>

00101c57 <vector209>:
.globl vector209
vector209:
  pushl $0
  101c57:	6a 00                	push   $0x0
  pushl $209
  101c59:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
  101c5e:	e9 b9 f5 ff ff       	jmp    10121c <alltraps>

00101c63 <vector210>:
.globl vector210
vector210:
  pushl $0
  101c63:	6a 00                	push   $0x0
  pushl $210
  101c65:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
  101c6a:	e9 ad f5 ff ff       	jmp    10121c <alltraps>

00101c6f <vector211>:
.globl vector211
vector211:
  pushl $0
  101c6f:	6a 00                	push   $0x0
  pushl $211
  101c71:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
  101c76:	e9 a1 f5 ff ff       	jmp    10121c <alltraps>

00101c7b <vector212>:
.globl vector212
vector212:
  pushl $0
  101c7b:	6a 00                	push   $0x0
  pushl $212
  101c7d:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
  101c82:	e9 95 f5 ff ff       	jmp    10121c <alltraps>

00101c87 <vector213>:
.globl vector213
vector213:
  pushl $0
  101c87:	6a 00                	push   $0x0
  pushl $213
  101c89:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
  101c8e:	e9 89 f5 ff ff       	jmp    10121c <alltraps>

00101c93 <vector214>:
.globl vector214
vector214:
  pushl $0
  101c93:	6a 00                	push   $0x0
  pushl $214
  101c95:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
  101c9a:	e9 7d f5 ff ff       	jmp    10121c <alltraps>

00101c9f <vector215>:
.globl vector215
vector215:
  pushl $0
  101c9f:	6a 00                	push   $0x0
  pushl $215
  101ca1:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
  101ca6:	e9 71 f5 ff ff       	jmp    10121c <alltraps>

00101cab <vector216>:
.globl vector216
vector216:
  pushl $0
  101cab:	6a 00                	push   $0x0
  pushl $216
  101cad:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
  101cb2:	e9 65 f5 ff ff       	jmp    10121c <alltraps>

00101cb7 <vector217>:
.globl vector217
vector217:
  pushl $0
  101cb7:	6a 00                	push   $0x0
  pushl $217
  101cb9:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
  101cbe:	e9 59 f5 ff ff       	jmp    10121c <alltraps>

00101cc3 <vector218>:
.globl vector218
vector218:
  pushl $0
  101cc3:	6a 00                	push   $0x0
  pushl $218
  101cc5:	68 da 00 00 00       	push   $0xda
  jmp alltraps
  101cca:	e9 4d f5 ff ff       	jmp    10121c <alltraps>

00101ccf <vector219>:
.globl vector219
vector219:
  pushl $0
  101ccf:	6a 00                	push   $0x0
  pushl $219
  101cd1:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
  101cd6:	e9 41 f5 ff ff       	jmp    10121c <alltraps>

00101cdb <vector220>:
.globl vector220
vector220:
  pushl $0
  101cdb:	6a 00                	push   $0x0
  pushl $220
  101cdd:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
  101ce2:	e9 35 f5 ff ff       	jmp    10121c <alltraps>

00101ce7 <vector221>:
.globl vector221
vector221:
  pushl $0
  101ce7:	6a 00                	push   $0x0
  pushl $221
  101ce9:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
  101cee:	e9 29 f5 ff ff       	jmp    10121c <alltraps>

00101cf3 <vector222>:
.globl vector222
vector222:
  pushl $0
  101cf3:	6a 00                	push   $0x0
  pushl $222
  101cf5:	68 de 00 00 00       	push   $0xde
  jmp alltraps
  101cfa:	e9 1d f5 ff ff       	jmp    10121c <alltraps>

00101cff <vector223>:
.globl vector223
vector223:
  pushl $0
  101cff:	6a 00                	push   $0x0
  pushl $223
  101d01:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
  101d06:	e9 11 f5 ff ff       	jmp    10121c <alltraps>

00101d0b <vector224>:
.globl vector224
vector224:
  pushl $0
  101d0b:	6a 00                	push   $0x0
  pushl $224
  101d0d:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
  101d12:	e9 05 f5 ff ff       	jmp    10121c <alltraps>

00101d17 <vector225>:
.globl vector225
vector225:
  pushl $0
  101d17:	6a 00                	push   $0x0
  pushl $225
  101d19:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
  101d1e:	e9 f9 f4 ff ff       	jmp    10121c <alltraps>

00101d23 <vector226>:
.globl vector226
vector226:
  pushl $0
  101d23:	6a 00                	push   $0x0
  pushl $226
  101d25:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
  101d2a:	e9 ed f4 ff ff       	jmp    10121c <alltraps>

00101d2f <vector227>:
.globl vector227
vector227:
  pushl $0
  101d2f:	6a 00                	push   $0x0
  pushl $227
  101d31:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
  101d36:	e9 e1 f4 ff ff       	jmp    10121c <alltraps>

00101d3b <vector228>:
.globl vector228
vector228:
  pushl $0
  101d3b:	6a 00                	push   $0x0
  pushl $228
  101d3d:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
  101d42:	e9 d5 f4 ff ff       	jmp    10121c <alltraps>

00101d47 <vector229>:
.globl vector229
vector229:
  pushl $0
  101d47:	6a 00                	push   $0x0
  pushl $229
  101d49:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
  101d4e:	e9 c9 f4 ff ff       	jmp    10121c <alltraps>

00101d53 <vector230>:
.globl vector230
vector230:
  pushl $0
  101d53:	6a 00                	push   $0x0
  pushl $230
  101d55:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
  101d5a:	e9 bd f4 ff ff       	jmp    10121c <alltraps>

00101d5f <vector231>:
.globl vector231
vector231:
  pushl $0
  101d5f:	6a 00                	push   $0x0
  pushl $231
  101d61:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
  101d66:	e9 b1 f4 ff ff       	jmp    10121c <alltraps>

00101d6b <vector232>:
.globl vector232
vector232:
  pushl $0
  101d6b:	6a 00                	push   $0x0
  pushl $232
  101d6d:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
  101d72:	e9 a5 f4 ff ff       	jmp    10121c <alltraps>

00101d77 <vector233>:
.globl vector233
vector233:
  pushl $0
  101d77:	6a 00                	push   $0x0
  pushl $233
  101d79:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
  101d7e:	e9 99 f4 ff ff       	jmp    10121c <alltraps>

00101d83 <vector234>:
.globl vector234
vector234:
  pushl $0
  101d83:	6a 00                	push   $0x0
  pushl $234
  101d85:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
  101d8a:	e9 8d f4 ff ff       	jmp    10121c <alltraps>

00101d8f <vector235>:
.globl vector235
vector235:
  pushl $0
  101d8f:	6a 00                	push   $0x0
  pushl $235
  101d91:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
  101d96:	e9 81 f4 ff ff       	jmp    10121c <alltraps>

00101d9b <vector236>:
.globl vector236
vector236:
  pushl $0
  101d9b:	6a 00                	push   $0x0
  pushl $236
  101d9d:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
  101da2:	e9 75 f4 ff ff       	jmp    10121c <alltraps>

00101da7 <vector237>:
.globl vector237
vector237:
  pushl $0
  101da7:	6a 00                	push   $0x0
  pushl $237
  101da9:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
  101dae:	e9 69 f4 ff ff       	jmp    10121c <alltraps>

00101db3 <vector238>:
.globl vector238
vector238:
  pushl $0
  101db3:	6a 00                	push   $0x0
  pushl $238
  101db5:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
  101dba:	e9 5d f4 ff ff       	jmp    10121c <alltraps>

00101dbf <vector239>:
.globl vector239
vector239:
  pushl $0
  101dbf:	6a 00                	push   $0x0
  pushl $239
  101dc1:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
  101dc6:	e9 51 f4 ff ff       	jmp    10121c <alltraps>

00101dcb <vector240>:
.globl vector240
vector240:
  pushl $0
  101dcb:	6a 00                	push   $0x0
  pushl $240
  101dcd:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
  101dd2:	e9 45 f4 ff ff       	jmp    10121c <alltraps>

00101dd7 <vector241>:
.globl vector241
vector241:
  pushl $0
  101dd7:	6a 00                	push   $0x0
  pushl $241
  101dd9:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
  101dde:	e9 39 f4 ff ff       	jmp    10121c <alltraps>

00101de3 <vector242>:
.globl vector242
vector242:
  pushl $0
  101de3:	6a 00                	push   $0x0
  pushl $242
  101de5:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
  101dea:	e9 2d f4 ff ff       	jmp    10121c <alltraps>

00101def <vector243>:
.globl vector243
vector243:
  pushl $0
  101def:	6a 00                	push   $0x0
  pushl $243
  101df1:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
  101df6:	e9 21 f4 ff ff       	jmp    10121c <alltraps>

00101dfb <vector244>:
.globl vector244
vector244:
  pushl $0
  101dfb:	6a 00                	push   $0x0
  pushl $244
  101dfd:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
  101e02:	e9 15 f4 ff ff       	jmp    10121c <alltraps>

00101e07 <vector245>:
.globl vector245
vector245:
  pushl $0
  101e07:	6a 00                	push   $0x0
  pushl $245
  101e09:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
  101e0e:	e9 09 f4 ff ff       	jmp    10121c <alltraps>

00101e13 <vector246>:
.globl vector246
vector246:
  pushl $0
  101e13:	6a 00                	push   $0x0
  pushl $246
  101e15:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
  101e1a:	e9 fd f3 ff ff       	jmp    10121c <alltraps>

00101e1f <vector247>:
.globl vector247
vector247:
  pushl $0
  101e1f:	6a 00                	push   $0x0
  pushl $247
  101e21:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
  101e26:	e9 f1 f3 ff ff       	jmp    10121c <alltraps>

00101e2b <vector248>:
.globl vector248
vector248:
  pushl $0
  101e2b:	6a 00                	push   $0x0
  pushl $248
  101e2d:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
  101e32:	e9 e5 f3 ff ff       	jmp    10121c <alltraps>

00101e37 <vector249>:
.globl vector249
vector249:
  pushl $0
  101e37:	6a 00                	push   $0x0
  pushl $249
  101e39:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
  101e3e:	e9 d9 f3 ff ff       	jmp    10121c <alltraps>

00101e43 <vector250>:
.globl vector250
vector250:
  pushl $0
  101e43:	6a 00                	push   $0x0
  pushl $250
  101e45:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
  101e4a:	e9 cd f3 ff ff       	jmp    10121c <alltraps>

00101e4f <vector251>:
.globl vector251
vector251:
  pushl $0
  101e4f:	6a 00                	push   $0x0
  pushl $251
  101e51:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
  101e56:	e9 c1 f3 ff ff       	jmp    10121c <alltraps>

00101e5b <vector252>:
.globl vector252
vector252:
  pushl $0
  101e5b:	6a 00                	push   $0x0
  pushl $252
  101e5d:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
  101e62:	e9 b5 f3 ff ff       	jmp    10121c <alltraps>

00101e67 <vector253>:
.globl vector253
vector253:
  pushl $0
  101e67:	6a 00                	push   $0x0
  pushl $253
  101e69:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
  101e6e:	e9 a9 f3 ff ff       	jmp    10121c <alltraps>

00101e73 <vector254>:
.globl vector254
vector254:
  pushl $0
  101e73:	6a 00                	push   $0x0
  pushl $254
  101e75:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
  101e7a:	e9 9d f3 ff ff       	jmp    10121c <alltraps>

00101e7f <vector255>:
.globl vector255
vector255:
  pushl $0
  101e7f:	6a 00                	push   $0x0
  pushl $255
  101e81:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
  101e86:	e9 91 f3 ff ff       	jmp    10121c <alltraps>

00101e8b <binit>:
  struct buf head;
} bcache, lcache;

void
binit(void)
{
  101e8b:	55                   	push   %ebp
  101e8c:	89 e5                	mov    %esp,%ebp
  101e8e:	83 ec 10             	sub    $0x10,%esp
  struct buf *b;

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  101e91:	c7 05 58 9c 10 00 48 	movl   $0x109c48,0x109c58
  101e98:	9c 10 00 
  bcache.head.next = &bcache.head;
  101e9b:	c7 05 5c 9c 10 00 48 	movl   $0x109c48,0x109c5c
  101ea2:	9c 10 00 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
  101ea5:	c7 45 fc 00 5d 10 00 	movl   $0x105d00,-0x4(%ebp)
  101eac:	eb 30                	jmp    101ede <binit+0x53>
    b->next = bcache.head.next;
  101eae:	8b 15 5c 9c 10 00    	mov    0x109c5c,%edx
  101eb4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101eb7:	89 50 14             	mov    %edx,0x14(%eax)
    b->prev = &bcache.head;
  101eba:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101ebd:	c7 40 10 48 9c 10 00 	movl   $0x109c48,0x10(%eax)
    bcache.head.next->prev = b;
  101ec4:	a1 5c 9c 10 00       	mov    0x109c5c,%eax
  101ec9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101ecc:	89 50 10             	mov    %edx,0x10(%eax)
    bcache.head.next = b;
  101ecf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101ed2:	a3 5c 9c 10 00       	mov    %eax,0x109c5c
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
  101ed7:	81 45 fc 1c 02 00 00 	addl   $0x21c,-0x4(%ebp)
  101ede:	b8 48 9c 10 00       	mov    $0x109c48,%eax
  101ee3:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101ee6:	72 c6                	jb     101eae <binit+0x23>
  }

  // Create linked list of buffers
  lcache.head.prev = &lcache.head;
  101ee8:	c7 05 d8 dd 10 00 c8 	movl   $0x10ddc8,0x10ddd8
  101eef:	dd 10 00 
  lcache.head.next = &lcache.head;
  101ef2:	c7 05 dc dd 10 00 c8 	movl   $0x10ddc8,0x10dddc
  101ef9:	dd 10 00 
  for(b = lcache.buf; b < lcache.buf+NBUF; b++){
  101efc:	c7 45 fc 80 9e 10 00 	movl   $0x109e80,-0x4(%ebp)
  101f03:	eb 30                	jmp    101f35 <binit+0xaa>
    b->next = lcache.head.next;
  101f05:	8b 15 dc dd 10 00    	mov    0x10dddc,%edx
  101f0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101f0e:	89 50 14             	mov    %edx,0x14(%eax)
    b->prev = &lcache.head;
  101f11:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101f14:	c7 40 10 c8 dd 10 00 	movl   $0x10ddc8,0x10(%eax)
    lcache.head.next->prev = b;
  101f1b:	a1 dc dd 10 00       	mov    0x10dddc,%eax
  101f20:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101f23:	89 50 10             	mov    %edx,0x10(%eax)
    lcache.head.next = b;
  101f26:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101f29:	a3 dc dd 10 00       	mov    %eax,0x10dddc
  for(b = lcache.buf; b < lcache.buf+NBUF; b++){
  101f2e:	81 45 fc 1c 02 00 00 	addl   $0x21c,-0x4(%ebp)
  101f35:	b8 c8 dd 10 00       	mov    $0x10ddc8,%eax
  101f3a:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101f3d:	72 c6                	jb     101f05 <binit+0x7a>
  }
}
  101f3f:	90                   	nop
  101f40:	90                   	nop
  101f41:	c9                   	leave
  101f42:	c3                   	ret

00101f43 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
  101f43:	55                   	push   %ebp
  101f44:	89 e5                	mov    %esp,%ebp
  101f46:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
  101f49:	a1 5c 9c 10 00       	mov    0x109c5c,%eax
  101f4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101f51:	eb 33                	jmp    101f86 <bget+0x43>
    if(b->dev == dev && b->blockno == blockno){
  101f53:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f56:	8b 40 04             	mov    0x4(%eax),%eax
  101f59:	39 45 08             	cmp    %eax,0x8(%ebp)
  101f5c:	75 1f                	jne    101f7d <bget+0x3a>
  101f5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f61:	8b 40 08             	mov    0x8(%eax),%eax
  101f64:	39 45 0c             	cmp    %eax,0xc(%ebp)
  101f67:	75 14                	jne    101f7d <bget+0x3a>
      b->refcnt++;
  101f69:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f6c:	8b 40 0c             	mov    0xc(%eax),%eax
  101f6f:	8d 50 01             	lea    0x1(%eax),%edx
  101f72:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f75:	89 50 0c             	mov    %edx,0xc(%eax)
      return b;
  101f78:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f7b:	eb 7b                	jmp    101ff8 <bget+0xb5>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
  101f7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f80:	8b 40 14             	mov    0x14(%eax),%eax
  101f83:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101f86:	81 7d f4 48 9c 10 00 	cmpl   $0x109c48,-0xc(%ebp)
  101f8d:	75 c4                	jne    101f53 <bget+0x10>
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
  101f8f:	a1 58 9c 10 00       	mov    0x109c58,%eax
  101f94:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101f97:	eb 49                	jmp    101fe2 <bget+0x9f>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
  101f99:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f9c:	8b 40 0c             	mov    0xc(%eax),%eax
  101f9f:	85 c0                	test   %eax,%eax
  101fa1:	75 36                	jne    101fd9 <bget+0x96>
  101fa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fa6:	8b 00                	mov    (%eax),%eax
  101fa8:	83 e0 04             	and    $0x4,%eax
  101fab:	85 c0                	test   %eax,%eax
  101fad:	75 2a                	jne    101fd9 <bget+0x96>
      b->dev = dev;
  101faf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fb2:	8b 55 08             	mov    0x8(%ebp),%edx
  101fb5:	89 50 04             	mov    %edx,0x4(%eax)
      b->blockno = blockno;
  101fb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fbb:	8b 55 0c             	mov    0xc(%ebp),%edx
  101fbe:	89 50 08             	mov    %edx,0x8(%eax)
      b->flags = 0;
  101fc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fc4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
      b->refcnt = 1;
  101fca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fcd:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
      return b;
  101fd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fd7:	eb 1f                	jmp    101ff8 <bget+0xb5>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
  101fd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fdc:	8b 40 10             	mov    0x10(%eax),%eax
  101fdf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101fe2:	81 7d f4 48 9c 10 00 	cmpl   $0x109c48,-0xc(%ebp)
  101fe9:	75 ae                	jne    101f99 <bget+0x56>
    }
  }
  panic("bget: no buffers");
  101feb:	83 ec 0c             	sub    $0xc,%esp
  101fee:	68 94 43 10 00       	push   $0x104394
  101ff3:	e8 b5 e2 ff ff       	call   1002ad <panic>
}
  101ff8:	c9                   	leave
  101ff9:	c3                   	ret

00101ffa <lget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
struct buf*
lget(uint dev, uint blockno)
{
  101ffa:	55                   	push   %ebp
  101ffb:	89 e5                	mov    %esp,%ebp
  101ffd:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // Is the block already cached?
  for(b = lcache.head.next; b != &lcache.head; b = b->next){
  102000:	a1 dc dd 10 00       	mov    0x10dddc,%eax
  102005:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102008:	eb 33                	jmp    10203d <lget+0x43>
    if(b->dev == dev && b->blockno == blockno){
  10200a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10200d:	8b 40 04             	mov    0x4(%eax),%eax
  102010:	39 45 08             	cmp    %eax,0x8(%ebp)
  102013:	75 1f                	jne    102034 <lget+0x3a>
  102015:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102018:	8b 40 08             	mov    0x8(%eax),%eax
  10201b:	39 45 0c             	cmp    %eax,0xc(%ebp)
  10201e:	75 14                	jne    102034 <lget+0x3a>
      b->refcnt++;
  102020:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102023:	8b 40 0c             	mov    0xc(%eax),%eax
  102026:	8d 50 01             	lea    0x1(%eax),%edx
  102029:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10202c:	89 50 0c             	mov    %edx,0xc(%eax)
      return b;
  10202f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102032:	eb 7b                	jmp    1020af <lget+0xb5>
  for(b = lcache.head.next; b != &lcache.head; b = b->next){
  102034:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102037:	8b 40 14             	mov    0x14(%eax),%eax
  10203a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10203d:	81 7d f4 c8 dd 10 00 	cmpl   $0x10ddc8,-0xc(%ebp)
  102044:	75 c4                	jne    10200a <lget+0x10>
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = lcache.head.prev; b != &lcache.head; b = b->prev){
  102046:	a1 d8 dd 10 00       	mov    0x10ddd8,%eax
  10204b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10204e:	eb 49                	jmp    102099 <lget+0x9f>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
  102050:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102053:	8b 40 0c             	mov    0xc(%eax),%eax
  102056:	85 c0                	test   %eax,%eax
  102058:	75 36                	jne    102090 <lget+0x96>
  10205a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10205d:	8b 00                	mov    (%eax),%eax
  10205f:	83 e0 04             	and    $0x4,%eax
  102062:	85 c0                	test   %eax,%eax
  102064:	75 2a                	jne    102090 <lget+0x96>
      b->dev = dev;
  102066:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102069:	8b 55 08             	mov    0x8(%ebp),%edx
  10206c:	89 50 04             	mov    %edx,0x4(%eax)
      b->blockno = blockno;
  10206f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102072:	8b 55 0c             	mov    0xc(%ebp),%edx
  102075:	89 50 08             	mov    %edx,0x8(%eax)
      b->flags = 0;
  102078:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10207b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
      b->refcnt = 1;
  102081:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102084:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
      return b;
  10208b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10208e:	eb 1f                	jmp    1020af <lget+0xb5>
  for(b = lcache.head.prev; b != &lcache.head; b = b->prev){
  102090:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102093:	8b 40 10             	mov    0x10(%eax),%eax
  102096:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102099:	81 7d f4 c8 dd 10 00 	cmpl   $0x10ddc8,-0xc(%ebp)
  1020a0:	75 ae                	jne    102050 <lget+0x56>
    }
  }
  panic("lget: no buffers");
  1020a2:	83 ec 0c             	sub    $0xc,%esp
  1020a5:	68 a5 43 10 00       	push   $0x1043a5
  1020aa:	e8 fe e1 ff ff       	call   1002ad <panic>
}
  1020af:	c9                   	leave
  1020b0:	c3                   	ret

001020b1 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
  1020b1:	55                   	push   %ebp
  1020b2:	89 e5                	mov    %esp,%ebp
  1020b4:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  b = bget(dev, blockno);
  1020b7:	83 ec 08             	sub    $0x8,%esp
  1020ba:	ff 75 0c             	push   0xc(%ebp)
  1020bd:	ff 75 08             	push   0x8(%ebp)
  1020c0:	e8 7e fe ff ff       	call   101f43 <bget>
  1020c5:	83 c4 10             	add    $0x10,%esp
  1020c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((b->flags & B_VALID) == 0) {
  1020cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1020ce:	8b 00                	mov    (%eax),%eax
  1020d0:	83 e0 02             	and    $0x2,%eax
  1020d3:	85 c0                	test   %eax,%eax
  1020d5:	75 0e                	jne    1020e5 <bread+0x34>
    iderw(b);
  1020d7:	83 ec 0c             	sub    $0xc,%esp
  1020da:	ff 75 f4             	push   -0xc(%ebp)
  1020dd:	e8 19 05 00 00       	call   1025fb <iderw>
  1020e2:	83 c4 10             	add    $0x10,%esp
  }
  return b;
  1020e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1020e8:	c9                   	leave
  1020e9:	c3                   	ret

001020ea <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  1020ea:	55                   	push   %ebp
  1020eb:	89 e5                	mov    %esp,%ebp
  1020ed:	83 ec 08             	sub    $0x8,%esp
  b->flags |= B_DIRTY;
  1020f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1020f3:	8b 00                	mov    (%eax),%eax
  1020f5:	83 c8 04             	or     $0x4,%eax
  1020f8:	89 c2                	mov    %eax,%edx
  1020fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1020fd:	89 10                	mov    %edx,(%eax)
  iderw(b);
  1020ff:	83 ec 0c             	sub    $0xc,%esp
  102102:	ff 75 08             	push   0x8(%ebp)
  102105:	e8 f1 04 00 00       	call   1025fb <iderw>
  10210a:	83 c4 10             	add    $0x10,%esp
}
  10210d:	90                   	nop
  10210e:	c9                   	leave
  10210f:	c3                   	ret

00102110 <lrelse>:

// Release a buffer.
// Move to the head of the MRU list.
void
lrelse(struct buf *b)
{
  102110:	55                   	push   %ebp
  102111:	89 e5                	mov    %esp,%ebp
  b->refcnt--;
  102113:	8b 45 08             	mov    0x8(%ebp),%eax
  102116:	8b 40 0c             	mov    0xc(%eax),%eax
  102119:	8d 50 ff             	lea    -0x1(%eax),%edx
  10211c:	8b 45 08             	mov    0x8(%ebp),%eax
  10211f:	89 50 0c             	mov    %edx,0xc(%eax)
  if (b->refcnt == 0) {
  102122:	8b 45 08             	mov    0x8(%ebp),%eax
  102125:	8b 40 0c             	mov    0xc(%eax),%eax
  102128:	85 c0                	test   %eax,%eax
  10212a:	75 47                	jne    102173 <lrelse+0x63>
    // no one is waiting for it.
    b->next->prev = b->prev;
  10212c:	8b 45 08             	mov    0x8(%ebp),%eax
  10212f:	8b 40 14             	mov    0x14(%eax),%eax
  102132:	8b 55 08             	mov    0x8(%ebp),%edx
  102135:	8b 52 10             	mov    0x10(%edx),%edx
  102138:	89 50 10             	mov    %edx,0x10(%eax)
    b->prev->next = b->next;
  10213b:	8b 45 08             	mov    0x8(%ebp),%eax
  10213e:	8b 40 10             	mov    0x10(%eax),%eax
  102141:	8b 55 08             	mov    0x8(%ebp),%edx
  102144:	8b 52 14             	mov    0x14(%edx),%edx
  102147:	89 50 14             	mov    %edx,0x14(%eax)
    b->next = lcache.head.next;
  10214a:	8b 15 dc dd 10 00    	mov    0x10dddc,%edx
  102150:	8b 45 08             	mov    0x8(%ebp),%eax
  102153:	89 50 14             	mov    %edx,0x14(%eax)
    b->prev = &lcache.head;
  102156:	8b 45 08             	mov    0x8(%ebp),%eax
  102159:	c7 40 10 c8 dd 10 00 	movl   $0x10ddc8,0x10(%eax)
    lcache.head.next->prev = b;
  102160:	a1 dc dd 10 00       	mov    0x10dddc,%eax
  102165:	8b 55 08             	mov    0x8(%ebp),%edx
  102168:	89 50 10             	mov    %edx,0x10(%eax)
    lcache.head.next = b;
  10216b:	8b 45 08             	mov    0x8(%ebp),%eax
  10216e:	a3 dc dd 10 00       	mov    %eax,0x10dddc
  }
}
  102173:	90                   	nop
  102174:	5d                   	pop    %ebp
  102175:	c3                   	ret

00102176 <bread_wr>:

struct buf* 
bread_wr(uint dev, uint blockno) {
  102176:	55                   	push   %ebp
  102177:	89 e5                	mov    %esp,%ebp
  102179:	83 ec 18             	sub    $0x18,%esp
  // IMPLEMENT YOUR CODE HERE
  struct buf* b;

  b = bget(dev, blockno);
  10217c:	83 ec 08             	sub    $0x8,%esp
  10217f:	ff 75 0c             	push   0xc(%ebp)
  102182:	ff 75 08             	push   0x8(%ebp)
  102185:	e8 b9 fd ff ff       	call   101f43 <bget>
  10218a:	83 c4 10             	add    $0x10,%esp
  10218d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if ((b->flags & B_VALID) == 0) {
  102190:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102193:	8b 00                	mov    (%eax),%eax
  102195:	83 e0 02             	and    $0x2,%eax
  102198:	85 c0                	test   %eax,%eax
  10219a:	75 0e                	jne    1021aa <bread_wr+0x34>
    iderw(b);
  10219c:	83 ec 0c             	sub    $0xc,%esp
  10219f:	ff 75 f4             	push   -0xc(%ebp)
  1021a2:	e8 54 04 00 00       	call   1025fb <iderw>
  1021a7:	83 c4 10             	add    $0x10,%esp
  }

  // Log Buffer Cache 
  struct buf* l = lget(b->dev, b->blockno);
  1021aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1021ad:	8b 50 08             	mov    0x8(%eax),%edx
  1021b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1021b3:	8b 40 04             	mov    0x4(%eax),%eax
  1021b6:	83 ec 08             	sub    $0x8,%esp
  1021b9:	52                   	push   %edx
  1021ba:	50                   	push   %eax
  1021bb:	e8 3a fe ff ff       	call   101ffa <lget>
  1021c0:	83 c4 10             	add    $0x10,%esp
  1021c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if((l->flags & B_VALID) == 0) {
  1021c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1021c9:	8b 00                	mov    (%eax),%eax
  1021cb:	83 e0 02             	and    $0x2,%eax
  1021ce:	85 c0                	test   %eax,%eax
  1021d0:	75 2d                	jne    1021ff <bread_wr+0x89>
    memmove(l->data, b->data, BSIZE);
  1021d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1021d5:	8d 50 1c             	lea    0x1c(%eax),%edx
  1021d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1021db:	83 c0 1c             	add    $0x1c,%eax
  1021de:	83 ec 04             	sub    $0x4,%esp
  1021e1:	68 00 02 00 00       	push   $0x200
  1021e6:	52                   	push   %edx
  1021e7:	50                   	push   %eax
  1021e8:	e8 79 ed ff ff       	call   100f66 <memmove>
  1021ed:	83 c4 10             	add    $0x10,%esp
    l->flags |= B_DIRTY;
  1021f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1021f3:	8b 00                	mov    (%eax),%eax
  1021f5:	83 c8 04             	or     $0x4,%eax
  1021f8:	89 c2                	mov    %eax,%edx
  1021fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1021fd:	89 10                	mov    %edx,(%eax)
  }
  lrelse(l);
  1021ff:	83 ec 0c             	sub    $0xc,%esp
  102202:	ff 75 f0             	push   -0x10(%ebp)
  102205:	e8 06 ff ff ff       	call   102110 <lrelse>
  10220a:	83 c4 10             	add    $0x10,%esp

  return b;
  10220d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102210:	c9                   	leave
  102211:	c3                   	ret

00102212 <brelse>:

// Release a buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  102212:	55                   	push   %ebp
  102213:	89 e5                	mov    %esp,%ebp
  b->refcnt--;
  102215:	8b 45 08             	mov    0x8(%ebp),%eax
  102218:	8b 40 0c             	mov    0xc(%eax),%eax
  10221b:	8d 50 ff             	lea    -0x1(%eax),%edx
  10221e:	8b 45 08             	mov    0x8(%ebp),%eax
  102221:	89 50 0c             	mov    %edx,0xc(%eax)
  if (b->refcnt == 0) {
  102224:	8b 45 08             	mov    0x8(%ebp),%eax
  102227:	8b 40 0c             	mov    0xc(%eax),%eax
  10222a:	85 c0                	test   %eax,%eax
  10222c:	75 47                	jne    102275 <brelse+0x63>
    // no one is waiting for it.
    b->next->prev = b->prev;
  10222e:	8b 45 08             	mov    0x8(%ebp),%eax
  102231:	8b 40 14             	mov    0x14(%eax),%eax
  102234:	8b 55 08             	mov    0x8(%ebp),%edx
  102237:	8b 52 10             	mov    0x10(%edx),%edx
  10223a:	89 50 10             	mov    %edx,0x10(%eax)
    b->prev->next = b->next;
  10223d:	8b 45 08             	mov    0x8(%ebp),%eax
  102240:	8b 40 10             	mov    0x10(%eax),%eax
  102243:	8b 55 08             	mov    0x8(%ebp),%edx
  102246:	8b 52 14             	mov    0x14(%edx),%edx
  102249:	89 50 14             	mov    %edx,0x14(%eax)
    b->next = bcache.head.next;
  10224c:	8b 15 5c 9c 10 00    	mov    0x109c5c,%edx
  102252:	8b 45 08             	mov    0x8(%ebp),%eax
  102255:	89 50 14             	mov    %edx,0x14(%eax)
    b->prev = &bcache.head;
  102258:	8b 45 08             	mov    0x8(%ebp),%eax
  10225b:	c7 40 10 48 9c 10 00 	movl   $0x109c48,0x10(%eax)
    bcache.head.next->prev = b;
  102262:	a1 5c 9c 10 00       	mov    0x109c5c,%eax
  102267:	8b 55 08             	mov    0x8(%ebp),%edx
  10226a:	89 50 10             	mov    %edx,0x10(%eax)
    bcache.head.next = b;
  10226d:	8b 45 08             	mov    0x8(%ebp),%eax
  102270:	a3 5c 9c 10 00       	mov    %eax,0x109c5c
  }
}
  102275:	90                   	nop
  102276:	5d                   	pop    %ebp
  102277:	c3                   	ret

00102278 <inb>:
// Simple PIO-based (non-DMA) IDE driver code.

#include "types.h"
#include "defs.h"
#include "param.h"
  102278:	55                   	push   %ebp
  102279:	89 e5                	mov    %esp,%ebp
  10227b:	83 ec 14             	sub    $0x14,%esp
  10227e:	8b 45 08             	mov    0x8(%ebp),%eax
  102281:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
#include "mmu.h"
#include "proc.h"
#include "x86.h"
  102285:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  102289:	89 c2                	mov    %eax,%edx
  10228b:	ec                   	in     (%dx),%al
  10228c:	88 45 ff             	mov    %al,-0x1(%ebp)
#include "traps.h"
  10228f:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
#include "fs.h"
  102293:	c9                   	leave
  102294:	c3                   	ret

00102295 <insl>:
#include "buf.h"

#define SECTOR_SIZE   512
#define IDE_BSY       0x80
  102295:	55                   	push   %ebp
  102296:	89 e5                	mov    %esp,%ebp
  102298:	57                   	push   %edi
  102299:	53                   	push   %ebx
#define IDE_DRDY      0x40
  10229a:	8b 55 08             	mov    0x8(%ebp),%edx
  10229d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1022a0:	8b 45 10             	mov    0x10(%ebp),%eax
  1022a3:	89 cb                	mov    %ecx,%ebx
  1022a5:	89 df                	mov    %ebx,%edi
  1022a7:	89 c1                	mov    %eax,%ecx
  1022a9:	fc                   	cld
  1022aa:	f3 6d                	rep insl (%dx),%es:(%edi)
  1022ac:	89 c8                	mov    %ecx,%eax
  1022ae:	89 fb                	mov    %edi,%ebx
  1022b0:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  1022b3:	89 45 10             	mov    %eax,0x10(%ebp)
#define IDE_DF        0x20
#define IDE_ERR       0x01

#define IDE_CMD_READ  0x20
  1022b6:	90                   	nop
  1022b7:	5b                   	pop    %ebx
  1022b8:	5f                   	pop    %edi
  1022b9:	5d                   	pop    %ebp
  1022ba:	c3                   	ret

001022bb <outb>:
#define IDE_CMD_WRITE 0x30
#define IDE_CMD_RDMUL 0xc4
#define IDE_CMD_WRMUL 0xc5

  1022bb:	55                   	push   %ebp
  1022bc:	89 e5                	mov    %esp,%ebp
  1022be:	83 ec 08             	sub    $0x8,%esp
  1022c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1022c4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1022c7:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1022cb:	89 d0                	mov    %edx,%eax
  1022cd:	88 45 f8             	mov    %al,-0x8(%ebp)
// idequeue points to the buf now being read/written to the disk.
  1022d0:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  1022d4:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1022d8:	ee                   	out    %al,(%dx)
// idequeue->qnext points to the next buf to be processed.
  1022d9:	90                   	nop
  1022da:	c9                   	leave
  1022db:	c3                   	ret

001022dc <outsl>:
static int havedisk1;
static void idestart(struct buf*);

// Wait for IDE disk to become ready.
static int
idewait(int checkerr)
  1022dc:	55                   	push   %ebp
  1022dd:	89 e5                	mov    %esp,%ebp
  1022df:	56                   	push   %esi
  1022e0:	53                   	push   %ebx
{
  1022e1:	8b 55 08             	mov    0x8(%ebp),%edx
  1022e4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1022e7:	8b 45 10             	mov    0x10(%ebp),%eax
  1022ea:	89 cb                	mov    %ecx,%ebx
  1022ec:	89 de                	mov    %ebx,%esi
  1022ee:	89 c1                	mov    %eax,%ecx
  1022f0:	fc                   	cld
  1022f1:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  1022f3:	89 c8                	mov    %ecx,%eax
  1022f5:	89 f3                	mov    %esi,%ebx
  1022f7:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  1022fa:	89 45 10             	mov    %eax,0x10(%ebp)
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY);
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
  1022fd:	90                   	nop
  1022fe:	5b                   	pop    %ebx
  1022ff:	5e                   	pop    %esi
  102300:	5d                   	pop    %ebp
  102301:	c3                   	ret

00102302 <noop>:
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
  102302:	55                   	push   %ebp
  102303:	89 e5                	mov    %esp,%ebp

  102305:	90                   	nop
  b->flags |= B_VALID;
  102306:	90                   	nop
  102307:	5d                   	pop    %ebp
  102308:	c3                   	ret

00102309 <idewait>:
{
  102309:	55                   	push   %ebp
  10230a:	89 e5                	mov    %esp,%ebp
  10230c:	83 ec 10             	sub    $0x10,%esp
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY);
  10230f:	90                   	nop
  102310:	68 f7 01 00 00       	push   $0x1f7
  102315:	e8 5e ff ff ff       	call   102278 <inb>
  10231a:	83 c4 04             	add    $0x4,%esp
  10231d:	0f b6 c0             	movzbl %al,%eax
  102320:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102323:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102326:	25 c0 00 00 00       	and    $0xc0,%eax
  10232b:	83 f8 40             	cmp    $0x40,%eax
  10232e:	75 e0                	jne    102310 <idewait+0x7>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
  102330:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102334:	74 11                	je     102347 <idewait+0x3e>
  102336:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102339:	83 e0 21             	and    $0x21,%eax
  10233c:	85 c0                	test   %eax,%eax
  10233e:	74 07                	je     102347 <idewait+0x3e>
    return -1;
  102340:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102345:	eb 05                	jmp    10234c <idewait+0x43>
  return 0;
  102347:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10234c:	c9                   	leave
  10234d:	c3                   	ret

0010234e <ideinit>:
{
  10234e:	55                   	push   %ebp
  10234f:	89 e5                	mov    %esp,%ebp
  102351:	83 ec 18             	sub    $0x18,%esp
  ioapicenable(IRQ_IDE, ncpu - 1);
  102354:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  102359:	83 e8 01             	sub    $0x1,%eax
  10235c:	83 ec 08             	sub    $0x8,%esp
  10235f:	50                   	push   %eax
  102360:	6a 0e                	push   $0xe
  102362:	e8 2e e2 ff ff       	call   100595 <ioapicenable>
  102367:	83 c4 10             	add    $0x10,%esp
  idewait(0);
  10236a:	83 ec 0c             	sub    $0xc,%esp
  10236d:	6a 00                	push   $0x0
  10236f:	e8 95 ff ff ff       	call   102309 <idewait>
  102374:	83 c4 10             	add    $0x10,%esp
  outb(0x1f6, 0xe0 | (1<<4));
  102377:	83 ec 08             	sub    $0x8,%esp
  10237a:	68 f0 00 00 00       	push   $0xf0
  10237f:	68 f6 01 00 00       	push   $0x1f6
  102384:	e8 32 ff ff ff       	call   1022bb <outb>
  102389:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<1000; i++){
  10238c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102393:	eb 24                	jmp    1023b9 <ideinit+0x6b>
    if(inb(0x1f7) != 0){
  102395:	83 ec 0c             	sub    $0xc,%esp
  102398:	68 f7 01 00 00       	push   $0x1f7
  10239d:	e8 d6 fe ff ff       	call   102278 <inb>
  1023a2:	83 c4 10             	add    $0x10,%esp
  1023a5:	84 c0                	test   %al,%al
  1023a7:	74 0c                	je     1023b5 <ideinit+0x67>
      havedisk1 = 1;
  1023a9:	c7 05 e8 df 10 00 01 	movl   $0x1,0x10dfe8
  1023b0:	00 00 00 
      break;
  1023b3:	eb 0d                	jmp    1023c2 <ideinit+0x74>
  for(i=0; i<1000; i++){
  1023b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1023b9:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  1023c0:	7e d3                	jle    102395 <ideinit+0x47>
  outb(0x1f6, 0xe0 | (0<<4));
  1023c2:	83 ec 08             	sub    $0x8,%esp
  1023c5:	68 e0 00 00 00       	push   $0xe0
  1023ca:	68 f6 01 00 00       	push   $0x1f6
  1023cf:	e8 e7 fe ff ff       	call   1022bb <outb>
  1023d4:	83 c4 10             	add    $0x10,%esp
}
  1023d7:	90                   	nop
  1023d8:	c9                   	leave
  1023d9:	c3                   	ret

001023da <idestart>:
{
  1023da:	55                   	push   %ebp
  1023db:	89 e5                	mov    %esp,%ebp
  1023dd:	83 ec 18             	sub    $0x18,%esp
  if(b == 0)
  1023e0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1023e4:	75 0d                	jne    1023f3 <idestart+0x19>
    panic("idestart");
  1023e6:	83 ec 0c             	sub    $0xc,%esp
  1023e9:	68 b6 43 10 00       	push   $0x1043b6
  1023ee:	e8 ba de ff ff       	call   1002ad <panic>
  if(b->blockno >= FSSIZE)
  1023f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1023f6:	8b 40 08             	mov    0x8(%eax),%eax
  1023f9:	3d e7 03 00 00       	cmp    $0x3e7,%eax
  1023fe:	76 0d                	jbe    10240d <idestart+0x33>
    panic("incorrect blockno");
  102400:	83 ec 0c             	sub    $0xc,%esp
  102403:	68 bf 43 10 00       	push   $0x1043bf
  102408:	e8 a0 de ff ff       	call   1002ad <panic>
  int sector_per_block =  BSIZE/SECTOR_SIZE;
  10240d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  int sector = b->blockno * sector_per_block;
  102414:	8b 45 08             	mov    0x8(%ebp),%eax
  102417:	8b 50 08             	mov    0x8(%eax),%edx
  10241a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10241d:	0f af c2             	imul   %edx,%eax
  102420:	89 45 f0             	mov    %eax,-0x10(%ebp)
  int read_cmd = (sector_per_block == 1) ? IDE_CMD_READ :  IDE_CMD_RDMUL;
  102423:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  102427:	75 07                	jne    102430 <idestart+0x56>
  102429:	b8 20 00 00 00       	mov    $0x20,%eax
  10242e:	eb 05                	jmp    102435 <idestart+0x5b>
  102430:	b8 c4 00 00 00       	mov    $0xc4,%eax
  102435:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int write_cmd = (sector_per_block == 1) ? IDE_CMD_WRITE : IDE_CMD_WRMUL;
  102438:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  10243c:	75 07                	jne    102445 <idestart+0x6b>
  10243e:	b8 30 00 00 00       	mov    $0x30,%eax
  102443:	eb 05                	jmp    10244a <idestart+0x70>
  102445:	b8 c5 00 00 00       	mov    $0xc5,%eax
  10244a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if (sector_per_block > 7) panic("idestart");
  10244d:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
  102451:	7e 0d                	jle    102460 <idestart+0x86>
  102453:	83 ec 0c             	sub    $0xc,%esp
  102456:	68 b6 43 10 00       	push   $0x1043b6
  10245b:	e8 4d de ff ff       	call   1002ad <panic>
  idewait(0);
  102460:	83 ec 0c             	sub    $0xc,%esp
  102463:	6a 00                	push   $0x0
  102465:	e8 9f fe ff ff       	call   102309 <idewait>
  10246a:	83 c4 10             	add    $0x10,%esp
  outb(0x3f6, 0);  // generate interrupt
  10246d:	83 ec 08             	sub    $0x8,%esp
  102470:	6a 00                	push   $0x0
  102472:	68 f6 03 00 00       	push   $0x3f6
  102477:	e8 3f fe ff ff       	call   1022bb <outb>
  10247c:	83 c4 10             	add    $0x10,%esp
  outb(0x1f2, sector_per_block);  // number of sectors
  10247f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102482:	0f b6 c0             	movzbl %al,%eax
  102485:	83 ec 08             	sub    $0x8,%esp
  102488:	50                   	push   %eax
  102489:	68 f2 01 00 00       	push   $0x1f2
  10248e:	e8 28 fe ff ff       	call   1022bb <outb>
  102493:	83 c4 10             	add    $0x10,%esp
  outb(0x1f3, sector & 0xff);
  102496:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102499:	0f b6 c0             	movzbl %al,%eax
  10249c:	83 ec 08             	sub    $0x8,%esp
  10249f:	50                   	push   %eax
  1024a0:	68 f3 01 00 00       	push   $0x1f3
  1024a5:	e8 11 fe ff ff       	call   1022bb <outb>
  1024aa:	83 c4 10             	add    $0x10,%esp
  outb(0x1f4, (sector >> 8) & 0xff);
  1024ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1024b0:	c1 f8 08             	sar    $0x8,%eax
  1024b3:	0f b6 c0             	movzbl %al,%eax
  1024b6:	83 ec 08             	sub    $0x8,%esp
  1024b9:	50                   	push   %eax
  1024ba:	68 f4 01 00 00       	push   $0x1f4
  1024bf:	e8 f7 fd ff ff       	call   1022bb <outb>
  1024c4:	83 c4 10             	add    $0x10,%esp
  outb(0x1f5, (sector >> 16) & 0xff);
  1024c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1024ca:	c1 f8 10             	sar    $0x10,%eax
  1024cd:	0f b6 c0             	movzbl %al,%eax
  1024d0:	83 ec 08             	sub    $0x8,%esp
  1024d3:	50                   	push   %eax
  1024d4:	68 f5 01 00 00       	push   $0x1f5
  1024d9:	e8 dd fd ff ff       	call   1022bb <outb>
  1024de:	83 c4 10             	add    $0x10,%esp
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  1024e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1024e4:	8b 40 04             	mov    0x4(%eax),%eax
  1024e7:	c1 e0 04             	shl    $0x4,%eax
  1024ea:	83 e0 10             	and    $0x10,%eax
  1024ed:	89 c2                	mov    %eax,%edx
  1024ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1024f2:	c1 f8 18             	sar    $0x18,%eax
  1024f5:	83 e0 0f             	and    $0xf,%eax
  1024f8:	09 d0                	or     %edx,%eax
  1024fa:	83 c8 e0             	or     $0xffffffe0,%eax
  1024fd:	0f b6 c0             	movzbl %al,%eax
  102500:	83 ec 08             	sub    $0x8,%esp
  102503:	50                   	push   %eax
  102504:	68 f6 01 00 00       	push   $0x1f6
  102509:	e8 ad fd ff ff       	call   1022bb <outb>
  10250e:	83 c4 10             	add    $0x10,%esp
  if(b->flags & B_DIRTY){
  102511:	8b 45 08             	mov    0x8(%ebp),%eax
  102514:	8b 00                	mov    (%eax),%eax
  102516:	83 e0 04             	and    $0x4,%eax
  102519:	85 c0                	test   %eax,%eax
  10251b:	74 35                	je     102552 <idestart+0x178>
    outb(0x1f7, write_cmd);
  10251d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102520:	0f b6 c0             	movzbl %al,%eax
  102523:	83 ec 08             	sub    $0x8,%esp
  102526:	50                   	push   %eax
  102527:	68 f7 01 00 00       	push   $0x1f7
  10252c:	e8 8a fd ff ff       	call   1022bb <outb>
  102531:	83 c4 10             	add    $0x10,%esp
    outsl(0x1f0, b->data, BSIZE/4);
  102534:	8b 45 08             	mov    0x8(%ebp),%eax
  102537:	83 c0 1c             	add    $0x1c,%eax
  10253a:	83 ec 04             	sub    $0x4,%esp
  10253d:	68 80 00 00 00       	push   $0x80
  102542:	50                   	push   %eax
  102543:	68 f0 01 00 00       	push   $0x1f0
  102548:	e8 8f fd ff ff       	call   1022dc <outsl>
  10254d:	83 c4 10             	add    $0x10,%esp
}
  102550:	eb 17                	jmp    102569 <idestart+0x18f>
    outb(0x1f7, read_cmd);
  102552:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102555:	0f b6 c0             	movzbl %al,%eax
  102558:	83 ec 08             	sub    $0x8,%esp
  10255b:	50                   	push   %eax
  10255c:	68 f7 01 00 00       	push   $0x1f7
  102561:	e8 55 fd ff ff       	call   1022bb <outb>
  102566:	83 c4 10             	add    $0x10,%esp
}
  102569:	90                   	nop
  10256a:	c9                   	leave
  10256b:	c3                   	ret

0010256c <ideintr>:
{
  10256c:	55                   	push   %ebp
  10256d:	89 e5                	mov    %esp,%ebp
  10256f:	83 ec 18             	sub    $0x18,%esp
  if((b = idequeue) == 0){
  102572:	a1 e4 df 10 00       	mov    0x10dfe4,%eax
  102577:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10257a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10257e:	74 78                	je     1025f8 <ideintr+0x8c>
  idequeue = b->qnext;
  102580:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102583:	8b 40 18             	mov    0x18(%eax),%eax
  102586:	a3 e4 df 10 00       	mov    %eax,0x10dfe4
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
  10258b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10258e:	8b 00                	mov    (%eax),%eax
  102590:	83 e0 04             	and    $0x4,%eax
  102593:	85 c0                	test   %eax,%eax
  102595:	75 27                	jne    1025be <ideintr+0x52>
  102597:	6a 01                	push   $0x1
  102599:	e8 6b fd ff ff       	call   102309 <idewait>
  10259e:	83 c4 04             	add    $0x4,%esp
  1025a1:	85 c0                	test   %eax,%eax
  1025a3:	78 19                	js     1025be <ideintr+0x52>
    insl(0x1f0, b->data, BSIZE/4);
  1025a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1025a8:	83 c0 1c             	add    $0x1c,%eax
  1025ab:	68 80 00 00 00       	push   $0x80
  1025b0:	50                   	push   %eax
  1025b1:	68 f0 01 00 00       	push   $0x1f0
  1025b6:	e8 da fc ff ff       	call   102295 <insl>
  1025bb:	83 c4 0c             	add    $0xc,%esp
  b->flags |= B_VALID;
  1025be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1025c1:	8b 00                	mov    (%eax),%eax
  1025c3:	83 c8 02             	or     $0x2,%eax
  1025c6:	89 c2                	mov    %eax,%edx
  1025c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1025cb:	89 10                	mov    %edx,(%eax)
  b->flags &= ~B_DIRTY;
  1025cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1025d0:	8b 00                	mov    (%eax),%eax
  1025d2:	83 e0 fb             	and    $0xfffffffb,%eax
  1025d5:	89 c2                	mov    %eax,%edx
  1025d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1025da:	89 10                	mov    %edx,(%eax)

  // Start disk on next buf in queue.
  if(idequeue != 0)
  1025dc:	a1 e4 df 10 00       	mov    0x10dfe4,%eax
  1025e1:	85 c0                	test   %eax,%eax
  1025e3:	74 14                	je     1025f9 <ideintr+0x8d>
    idestart(idequeue);
  1025e5:	a1 e4 df 10 00       	mov    0x10dfe4,%eax
  1025ea:	83 ec 0c             	sub    $0xc,%esp
  1025ed:	50                   	push   %eax
  1025ee:	e8 e7 fd ff ff       	call   1023da <idestart>
  1025f3:	83 c4 10             	add    $0x10,%esp
  1025f6:	eb 01                	jmp    1025f9 <ideintr+0x8d>
    return;
  1025f8:	90                   	nop
}
  1025f9:	c9                   	leave
  1025fa:	c3                   	ret

001025fb <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
  1025fb:	55                   	push   %ebp
  1025fc:	89 e5                	mov    %esp,%ebp
  1025fe:	83 ec 18             	sub    $0x18,%esp
  struct buf **pp;

  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
  102601:	8b 45 08             	mov    0x8(%ebp),%eax
  102604:	8b 00                	mov    (%eax),%eax
  102606:	83 e0 06             	and    $0x6,%eax
  102609:	83 f8 02             	cmp    $0x2,%eax
  10260c:	75 0d                	jne    10261b <iderw+0x20>
    panic("iderw: nothing to do");
  10260e:	83 ec 0c             	sub    $0xc,%esp
  102611:	68 d1 43 10 00       	push   $0x1043d1
  102616:	e8 92 dc ff ff       	call   1002ad <panic>
  if(b->dev != 0 && !havedisk1)
  10261b:	8b 45 08             	mov    0x8(%ebp),%eax
  10261e:	8b 40 04             	mov    0x4(%eax),%eax
  102621:	85 c0                	test   %eax,%eax
  102623:	74 16                	je     10263b <iderw+0x40>
  102625:	a1 e8 df 10 00       	mov    0x10dfe8,%eax
  10262a:	85 c0                	test   %eax,%eax
  10262c:	75 0d                	jne    10263b <iderw+0x40>
    panic("iderw: ide disk 1 not present");
  10262e:	83 ec 0c             	sub    $0xc,%esp
  102631:	68 e6 43 10 00       	push   $0x1043e6
  102636:	e8 72 dc ff ff       	call   1002ad <panic>

  // Append b to idequeue.
  b->qnext = 0;
  10263b:	8b 45 08             	mov    0x8(%ebp),%eax
  10263e:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
  102645:	c7 45 f4 e4 df 10 00 	movl   $0x10dfe4,-0xc(%ebp)
  10264c:	eb 0b                	jmp    102659 <iderw+0x5e>
  10264e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102651:	8b 00                	mov    (%eax),%eax
  102653:	83 c0 18             	add    $0x18,%eax
  102656:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102659:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10265c:	8b 00                	mov    (%eax),%eax
  10265e:	85 c0                	test   %eax,%eax
  102660:	75 ec                	jne    10264e <iderw+0x53>
    ;
  *pp = b;
  102662:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102665:	8b 55 08             	mov    0x8(%ebp),%edx
  102668:	89 10                	mov    %edx,(%eax)

  // Start disk if necessary.
  if(idequeue == b)
  10266a:	a1 e4 df 10 00       	mov    0x10dfe4,%eax
  10266f:	39 45 08             	cmp    %eax,0x8(%ebp)
  102672:	75 15                	jne    102689 <iderw+0x8e>
    idestart(b);
  102674:	83 ec 0c             	sub    $0xc,%esp
  102677:	ff 75 08             	push   0x8(%ebp)
  10267a:	e8 5b fd ff ff       	call   1023da <idestart>
  10267f:	83 c4 10             	add    $0x10,%esp

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID)
  102682:	eb 05                	jmp    102689 <iderw+0x8e>
  {
    // Warning: If we do not call noop(), compiler generates code that does not
    // read "b->flags" again and therefore never come out of this while loop. 
    // "b->flags" is modified by the trap handler in ideintr().  
    noop();
  102684:	e8 79 fc ff ff       	call   102302 <noop>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID)
  102689:	8b 45 08             	mov    0x8(%ebp),%eax
  10268c:	8b 00                	mov    (%eax),%eax
  10268e:	83 e0 06             	and    $0x6,%eax
  102691:	83 f8 02             	cmp    $0x2,%eax
  102694:	75 ee                	jne    102684 <iderw+0x89>
  }
}
  102696:	90                   	nop
  102697:	90                   	nop
  102698:	c9                   	leave
  102699:	c3                   	ret

0010269a <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
  10269a:	55                   	push   %ebp
  10269b:	89 e5                	mov    %esp,%ebp
  10269d:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;

  bp = bread(dev, 1);
  1026a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1026a3:	83 ec 08             	sub    $0x8,%esp
  1026a6:	6a 01                	push   $0x1
  1026a8:	50                   	push   %eax
  1026a9:	e8 03 fa ff ff       	call   1020b1 <bread>
  1026ae:	83 c4 10             	add    $0x10,%esp
  1026b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memmove(sb, bp->data, sizeof(*sb));
  1026b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026b7:	83 c0 1c             	add    $0x1c,%eax
  1026ba:	83 ec 04             	sub    $0x4,%esp
  1026bd:	6a 1c                	push   $0x1c
  1026bf:	50                   	push   %eax
  1026c0:	ff 75 0c             	push   0xc(%ebp)
  1026c3:	e8 9e e8 ff ff       	call   100f66 <memmove>
  1026c8:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  1026cb:	83 ec 0c             	sub    $0xc,%esp
  1026ce:	ff 75 f4             	push   -0xc(%ebp)
  1026d1:	e8 3c fb ff ff       	call   102212 <brelse>
  1026d6:	83 c4 10             	add    $0x10,%esp
}
  1026d9:	90                   	nop
  1026da:	c9                   	leave
  1026db:	c3                   	ret

001026dc <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
  1026dc:	55                   	push   %ebp
  1026dd:	89 e5                	mov    %esp,%ebp
  1026df:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;

  bp = bread_wr(dev, bno);
  1026e2:	8b 55 0c             	mov    0xc(%ebp),%edx
  1026e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1026e8:	83 ec 08             	sub    $0x8,%esp
  1026eb:	52                   	push   %edx
  1026ec:	50                   	push   %eax
  1026ed:	e8 84 fa ff ff       	call   102176 <bread_wr>
  1026f2:	83 c4 10             	add    $0x10,%esp
  1026f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(bp->data, 0, BSIZE);
  1026f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026fb:	83 c0 1c             	add    $0x1c,%eax
  1026fe:	83 ec 04             	sub    $0x4,%esp
  102701:	68 00 02 00 00       	push   $0x200
  102706:	6a 00                	push   $0x0
  102708:	50                   	push   %eax
  102709:	e8 99 e7 ff ff       	call   100ea7 <memset>
  10270e:	83 c4 10             	add    $0x10,%esp
  log_write(bp);
  102711:	83 ec 0c             	sub    $0xc,%esp
  102714:	ff 75 f4             	push   -0xc(%ebp)
  102717:	e8 15 19 00 00       	call   104031 <log_write>
  10271c:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  10271f:	83 ec 0c             	sub    $0xc,%esp
  102722:	ff 75 f4             	push   -0xc(%ebp)
  102725:	e8 e8 fa ff ff       	call   102212 <brelse>
  10272a:	83 c4 10             	add    $0x10,%esp
}
  10272d:	90                   	nop
  10272e:	c9                   	leave
  10272f:	c3                   	ret

00102730 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
  102730:	55                   	push   %ebp
  102731:	89 e5                	mov    %esp,%ebp
  102733:	83 ec 18             	sub    $0x18,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  102736:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(b = 0; b < sb.size; b += BPB){
  10273d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102744:	e9 0b 01 00 00       	jmp    102854 <balloc+0x124>
    bp = bread_wr(dev, BBLOCK(b, sb));
  102749:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10274c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  102752:	85 c0                	test   %eax,%eax
  102754:	0f 48 c2             	cmovs  %edx,%eax
  102757:	c1 f8 0c             	sar    $0xc,%eax
  10275a:	89 c2                	mov    %eax,%edx
  10275c:	a1 18 e0 10 00       	mov    0x10e018,%eax
  102761:	01 d0                	add    %edx,%eax
  102763:	83 ec 08             	sub    $0x8,%esp
  102766:	50                   	push   %eax
  102767:	ff 75 08             	push   0x8(%ebp)
  10276a:	e8 07 fa ff ff       	call   102176 <bread_wr>
  10276f:	83 c4 10             	add    $0x10,%esp
  102772:	89 45 ec             	mov    %eax,-0x14(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
  102775:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  10277c:	e9 9e 00 00 00       	jmp    10281f <balloc+0xef>
      m = 1 << (bi % 8);
  102781:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102784:	83 e0 07             	and    $0x7,%eax
  102787:	ba 01 00 00 00       	mov    $0x1,%edx
  10278c:	89 c1                	mov    %eax,%ecx
  10278e:	d3 e2                	shl    %cl,%edx
  102790:	89 d0                	mov    %edx,%eax
  102792:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
  102795:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102798:	8d 50 07             	lea    0x7(%eax),%edx
  10279b:	85 c0                	test   %eax,%eax
  10279d:	0f 48 c2             	cmovs  %edx,%eax
  1027a0:	c1 f8 03             	sar    $0x3,%eax
  1027a3:	89 c2                	mov    %eax,%edx
  1027a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1027a8:	0f b6 44 10 1c       	movzbl 0x1c(%eax,%edx,1),%eax
  1027ad:	0f b6 c0             	movzbl %al,%eax
  1027b0:	23 45 e8             	and    -0x18(%ebp),%eax
  1027b3:	85 c0                	test   %eax,%eax
  1027b5:	75 64                	jne    10281b <balloc+0xeb>
        bp->data[bi/8] |= m;  // Mark block in use.
  1027b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027ba:	8d 50 07             	lea    0x7(%eax),%edx
  1027bd:	85 c0                	test   %eax,%eax
  1027bf:	0f 48 c2             	cmovs  %edx,%eax
  1027c2:	c1 f8 03             	sar    $0x3,%eax
  1027c5:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1027c8:	0f b6 54 02 1c       	movzbl 0x1c(%edx,%eax,1),%edx
  1027cd:	89 d1                	mov    %edx,%ecx
  1027cf:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1027d2:	09 ca                	or     %ecx,%edx
  1027d4:	89 d1                	mov    %edx,%ecx
  1027d6:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1027d9:	88 4c 02 1c          	mov    %cl,0x1c(%edx,%eax,1)
        log_write(bp);
  1027dd:	83 ec 0c             	sub    $0xc,%esp
  1027e0:	ff 75 ec             	push   -0x14(%ebp)
  1027e3:	e8 49 18 00 00       	call   104031 <log_write>
  1027e8:	83 c4 10             	add    $0x10,%esp
        brelse(bp);
  1027eb:	83 ec 0c             	sub    $0xc,%esp
  1027ee:	ff 75 ec             	push   -0x14(%ebp)
  1027f1:	e8 1c fa ff ff       	call   102212 <brelse>
  1027f6:	83 c4 10             	add    $0x10,%esp
        bzero(dev, b + bi);
  1027f9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1027fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027ff:	01 c2                	add    %eax,%edx
  102801:	8b 45 08             	mov    0x8(%ebp),%eax
  102804:	83 ec 08             	sub    $0x8,%esp
  102807:	52                   	push   %edx
  102808:	50                   	push   %eax
  102809:	e8 ce fe ff ff       	call   1026dc <bzero>
  10280e:	83 c4 10             	add    $0x10,%esp
        return b + bi;
  102811:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102814:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102817:	01 d0                	add    %edx,%eax
  102819:	eb 57                	jmp    102872 <balloc+0x142>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
  10281b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  10281f:	81 7d f0 ff 0f 00 00 	cmpl   $0xfff,-0x10(%ebp)
  102826:	7f 17                	jg     10283f <balloc+0x10f>
  102828:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10282b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10282e:	01 d0                	add    %edx,%eax
  102830:	89 c2                	mov    %eax,%edx
  102832:	a1 00 e0 10 00       	mov    0x10e000,%eax
  102837:	39 c2                	cmp    %eax,%edx
  102839:	0f 82 42 ff ff ff    	jb     102781 <balloc+0x51>
      }
    }
    brelse(bp);
  10283f:	83 ec 0c             	sub    $0xc,%esp
  102842:	ff 75 ec             	push   -0x14(%ebp)
  102845:	e8 c8 f9 ff ff       	call   102212 <brelse>
  10284a:	83 c4 10             	add    $0x10,%esp
  for(b = 0; b < sb.size; b += BPB){
  10284d:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  102854:	8b 15 00 e0 10 00    	mov    0x10e000,%edx
  10285a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10285d:	39 c2                	cmp    %eax,%edx
  10285f:	0f 87 e4 fe ff ff    	ja     102749 <balloc+0x19>
  }
  panic("balloc: out of blocks");
  102865:	83 ec 0c             	sub    $0xc,%esp
  102868:	68 04 44 10 00       	push   $0x104404
  10286d:	e8 3b da ff ff       	call   1002ad <panic>
}
  102872:	c9                   	leave
  102873:	c3                   	ret

00102874 <bfree>:


// Free a disk block.
static void
bfree(int dev, uint b)
{
  102874:	55                   	push   %ebp
  102875:	89 e5                	mov    %esp,%ebp
  102877:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  int bi, m;

  bp = bread_wr(dev, BBLOCK(b, sb));
  10287a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10287d:	c1 e8 0c             	shr    $0xc,%eax
  102880:	89 c2                	mov    %eax,%edx
  102882:	a1 18 e0 10 00       	mov    0x10e018,%eax
  102887:	01 c2                	add    %eax,%edx
  102889:	8b 45 08             	mov    0x8(%ebp),%eax
  10288c:	83 ec 08             	sub    $0x8,%esp
  10288f:	52                   	push   %edx
  102890:	50                   	push   %eax
  102891:	e8 e0 f8 ff ff       	call   102176 <bread_wr>
  102896:	83 c4 10             	add    $0x10,%esp
  102899:	89 45 f4             	mov    %eax,-0xc(%ebp)
  bi = b % BPB;
  10289c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10289f:	25 ff 0f 00 00       	and    $0xfff,%eax
  1028a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  m = 1 << (bi % 8);
  1028a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028aa:	83 e0 07             	and    $0x7,%eax
  1028ad:	ba 01 00 00 00       	mov    $0x1,%edx
  1028b2:	89 c1                	mov    %eax,%ecx
  1028b4:	d3 e2                	shl    %cl,%edx
  1028b6:	89 d0                	mov    %edx,%eax
  1028b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((bp->data[bi/8] & m) == 0)
  1028bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028be:	8d 50 07             	lea    0x7(%eax),%edx
  1028c1:	85 c0                	test   %eax,%eax
  1028c3:	0f 48 c2             	cmovs  %edx,%eax
  1028c6:	c1 f8 03             	sar    $0x3,%eax
  1028c9:	89 c2                	mov    %eax,%edx
  1028cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1028ce:	0f b6 44 10 1c       	movzbl 0x1c(%eax,%edx,1),%eax
  1028d3:	0f b6 c0             	movzbl %al,%eax
  1028d6:	23 45 ec             	and    -0x14(%ebp),%eax
  1028d9:	85 c0                	test   %eax,%eax
  1028db:	75 0d                	jne    1028ea <bfree+0x76>
    panic("freeing free block");
  1028dd:	83 ec 0c             	sub    $0xc,%esp
  1028e0:	68 1a 44 10 00       	push   $0x10441a
  1028e5:	e8 c3 d9 ff ff       	call   1002ad <panic>
  bp->data[bi/8] &= ~m;
  1028ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028ed:	8d 50 07             	lea    0x7(%eax),%edx
  1028f0:	85 c0                	test   %eax,%eax
  1028f2:	0f 48 c2             	cmovs  %edx,%eax
  1028f5:	c1 f8 03             	sar    $0x3,%eax
  1028f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1028fb:	0f b6 54 02 1c       	movzbl 0x1c(%edx,%eax,1),%edx
  102900:	89 d1                	mov    %edx,%ecx
  102902:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102905:	f7 d2                	not    %edx
  102907:	21 ca                	and    %ecx,%edx
  102909:	89 d1                	mov    %edx,%ecx
  10290b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10290e:	88 4c 02 1c          	mov    %cl,0x1c(%edx,%eax,1)
  log_write(bp);
  102912:	83 ec 0c             	sub    $0xc,%esp
  102915:	ff 75 f4             	push   -0xc(%ebp)
  102918:	e8 14 17 00 00       	call   104031 <log_write>
  10291d:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  102920:	83 ec 0c             	sub    $0xc,%esp
  102923:	ff 75 f4             	push   -0xc(%ebp)
  102926:	e8 e7 f8 ff ff       	call   102212 <brelse>
  10292b:	83 c4 10             	add    $0x10,%esp
}
  10292e:	90                   	nop
  10292f:	c9                   	leave
  102930:	c3                   	ret

00102931 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
  102931:	55                   	push   %ebp
  102932:	89 e5                	mov    %esp,%ebp
  102934:	57                   	push   %edi
  102935:	56                   	push   %esi
  102936:	53                   	push   %ebx
  102937:	83 ec 1c             	sub    $0x1c,%esp
  readsb(dev, &sb);
  10293a:	83 ec 08             	sub    $0x8,%esp
  10293d:	68 00 e0 10 00       	push   $0x10e000
  102942:	ff 75 08             	push   0x8(%ebp)
  102945:	e8 50 fd ff ff       	call   10269a <readsb>
  10294a:	83 c4 10             	add    $0x10,%esp
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
  10294d:	a1 18 e0 10 00       	mov    0x10e018,%eax
  102952:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102955:	8b 3d 14 e0 10 00    	mov    0x10e014,%edi
  10295b:	8b 35 10 e0 10 00    	mov    0x10e010,%esi
  102961:	8b 1d 0c e0 10 00    	mov    0x10e00c,%ebx
  102967:	8b 0d 08 e0 10 00    	mov    0x10e008,%ecx
  10296d:	8b 15 04 e0 10 00    	mov    0x10e004,%edx
  102973:	a1 00 e0 10 00       	mov    0x10e000,%eax
  102978:	ff 75 e4             	push   -0x1c(%ebp)
  10297b:	57                   	push   %edi
  10297c:	56                   	push   %esi
  10297d:	53                   	push   %ebx
  10297e:	51                   	push   %ecx
  10297f:	52                   	push   %edx
  102980:	50                   	push   %eax
  102981:	68 30 44 10 00       	push   $0x104430
  102986:	e8 61 d7 ff ff       	call   1000ec <cprintf>
  10298b:	83 c4 20             	add    $0x20,%esp
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
  10298e:	90                   	nop
  10298f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102992:	5b                   	pop    %ebx
  102993:	5e                   	pop    %esi
  102994:	5f                   	pop    %edi
  102995:	5d                   	pop    %ebp
  102996:	c3                   	ret

00102997 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
  102997:	55                   	push   %ebp
  102998:	89 e5                	mov    %esp,%ebp
  10299a:	83 ec 28             	sub    $0x28,%esp
  10299d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029a0:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
  1029a4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  1029ab:	e9 9e 00 00 00       	jmp    102a4e <ialloc+0xb7>
    bp = bread_wr(dev, IBLOCK(inum, sb));
  1029b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029b3:	c1 e8 03             	shr    $0x3,%eax
  1029b6:	89 c2                	mov    %eax,%edx
  1029b8:	a1 14 e0 10 00       	mov    0x10e014,%eax
  1029bd:	01 d0                	add    %edx,%eax
  1029bf:	83 ec 08             	sub    $0x8,%esp
  1029c2:	50                   	push   %eax
  1029c3:	ff 75 08             	push   0x8(%ebp)
  1029c6:	e8 ab f7 ff ff       	call   102176 <bread_wr>
  1029cb:	83 c4 10             	add    $0x10,%esp
  1029ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
    dip = (struct dinode*)bp->data + inum%IPB;
  1029d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029d4:	8d 50 1c             	lea    0x1c(%eax),%edx
  1029d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029da:	83 e0 07             	and    $0x7,%eax
  1029dd:	c1 e0 06             	shl    $0x6,%eax
  1029e0:	01 d0                	add    %edx,%eax
  1029e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(dip->type == 0){  // a free inode
  1029e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1029e8:	0f b7 00             	movzwl (%eax),%eax
  1029eb:	66 85 c0             	test   %ax,%ax
  1029ee:	75 4c                	jne    102a3c <ialloc+0xa5>
      memset(dip, 0, sizeof(*dip));
  1029f0:	83 ec 04             	sub    $0x4,%esp
  1029f3:	6a 40                	push   $0x40
  1029f5:	6a 00                	push   $0x0
  1029f7:	ff 75 ec             	push   -0x14(%ebp)
  1029fa:	e8 a8 e4 ff ff       	call   100ea7 <memset>
  1029ff:	83 c4 10             	add    $0x10,%esp
      dip->type = type;
  102a02:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102a05:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  102a09:	66 89 10             	mov    %dx,(%eax)
      log_write(bp);   // mark it allocated on the disk
  102a0c:	83 ec 0c             	sub    $0xc,%esp
  102a0f:	ff 75 f0             	push   -0x10(%ebp)
  102a12:	e8 1a 16 00 00       	call   104031 <log_write>
  102a17:	83 c4 10             	add    $0x10,%esp
      brelse(bp);
  102a1a:	83 ec 0c             	sub    $0xc,%esp
  102a1d:	ff 75 f0             	push   -0x10(%ebp)
  102a20:	e8 ed f7 ff ff       	call   102212 <brelse>
  102a25:	83 c4 10             	add    $0x10,%esp
      return iget(dev, inum);
  102a28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a2b:	83 ec 08             	sub    $0x8,%esp
  102a2e:	50                   	push   %eax
  102a2f:	ff 75 08             	push   0x8(%ebp)
  102a32:	e8 64 01 00 00       	call   102b9b <iget>
  102a37:	83 c4 10             	add    $0x10,%esp
  102a3a:	eb 30                	jmp    102a6c <ialloc+0xd5>
    }
    brelse(bp);
  102a3c:	83 ec 0c             	sub    $0xc,%esp
  102a3f:	ff 75 f0             	push   -0x10(%ebp)
  102a42:	e8 cb f7 ff ff       	call   102212 <brelse>
  102a47:	83 c4 10             	add    $0x10,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
  102a4a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  102a4e:	8b 15 08 e0 10 00    	mov    0x10e008,%edx
  102a54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a57:	39 c2                	cmp    %eax,%edx
  102a59:	0f 87 51 ff ff ff    	ja     1029b0 <ialloc+0x19>
  }
  panic("ialloc: no inodes");
  102a5f:	83 ec 0c             	sub    $0xc,%esp
  102a62:	68 83 44 10 00       	push   $0x104483
  102a67:	e8 41 d8 ff ff       	call   1002ad <panic>
}
  102a6c:	c9                   	leave
  102a6d:	c3                   	ret

00102a6e <iput>:
// be recycled.
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
void
iput(struct inode *ip)
{
  102a6e:	55                   	push   %ebp
  102a6f:	89 e5                	mov    %esp,%ebp
  102a71:	83 ec 18             	sub    $0x18,%esp
  if(ip->valid && ip->nlink == 0){
  102a74:	8b 45 08             	mov    0x8(%ebp),%eax
  102a77:	8b 40 0c             	mov    0xc(%eax),%eax
  102a7a:	85 c0                	test   %eax,%eax
  102a7c:	74 4a                	je     102ac8 <iput+0x5a>
  102a7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102a81:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  102a85:	66 85 c0             	test   %ax,%ax
  102a88:	75 3e                	jne    102ac8 <iput+0x5a>
    int r = ip->ref;
  102a8a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a8d:	8b 40 08             	mov    0x8(%eax),%eax
  102a90:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(r == 1){
  102a93:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  102a97:	75 2f                	jne    102ac8 <iput+0x5a>
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
  102a99:	83 ec 0c             	sub    $0xc,%esp
  102a9c:	ff 75 08             	push   0x8(%ebp)
  102a9f:	e8 c1 03 00 00       	call   102e65 <itrunc>
  102aa4:	83 c4 10             	add    $0x10,%esp
      ip->type = 0;
  102aa7:	8b 45 08             	mov    0x8(%ebp),%eax
  102aaa:	66 c7 40 10 00 00    	movw   $0x0,0x10(%eax)
      iupdate(ip);
  102ab0:	83 ec 0c             	sub    $0xc,%esp
  102ab3:	ff 75 08             	push   0x8(%ebp)
  102ab6:	e8 1f 00 00 00       	call   102ada <iupdate>
  102abb:	83 c4 10             	add    $0x10,%esp
      ip->valid = 0;
  102abe:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac1:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    }
  }
  ip->ref--;
  102ac8:	8b 45 08             	mov    0x8(%ebp),%eax
  102acb:	8b 40 08             	mov    0x8(%eax),%eax
  102ace:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ad1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad4:	89 50 08             	mov    %edx,0x8(%eax)
}
  102ad7:	90                   	nop
  102ad8:	c9                   	leave
  102ad9:	c3                   	ret

00102ada <iupdate>:
// Copy a modified in-memory inode to disk.
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
void
iupdate(struct inode *ip)
{
  102ada:	55                   	push   %ebp
  102adb:	89 e5                	mov    %esp,%ebp
  102add:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  struct dinode *dip;

  bp = bread_wr(ip->dev, IBLOCK(ip->inum, sb));
  102ae0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae3:	8b 40 04             	mov    0x4(%eax),%eax
  102ae6:	c1 e8 03             	shr    $0x3,%eax
  102ae9:	89 c2                	mov    %eax,%edx
  102aeb:	a1 14 e0 10 00       	mov    0x10e014,%eax
  102af0:	01 c2                	add    %eax,%edx
  102af2:	8b 45 08             	mov    0x8(%ebp),%eax
  102af5:	8b 00                	mov    (%eax),%eax
  102af7:	83 ec 08             	sub    $0x8,%esp
  102afa:	52                   	push   %edx
  102afb:	50                   	push   %eax
  102afc:	e8 75 f6 ff ff       	call   102176 <bread_wr>
  102b01:	83 c4 10             	add    $0x10,%esp
  102b04:	89 45 f4             	mov    %eax,-0xc(%ebp)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  102b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b0a:	8d 50 1c             	lea    0x1c(%eax),%edx
  102b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  102b10:	8b 40 04             	mov    0x4(%eax),%eax
  102b13:	83 e0 07             	and    $0x7,%eax
  102b16:	c1 e0 06             	shl    $0x6,%eax
  102b19:	01 d0                	add    %edx,%eax
  102b1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  dip->type = ip->type;
  102b1e:	8b 45 08             	mov    0x8(%ebp),%eax
  102b21:	0f b7 50 10          	movzwl 0x10(%eax),%edx
  102b25:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b28:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
  102b2b:	8b 45 08             	mov    0x8(%ebp),%eax
  102b2e:	0f b7 50 12          	movzwl 0x12(%eax),%edx
  102b32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b35:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
  102b39:	8b 45 08             	mov    0x8(%ebp),%eax
  102b3c:	0f b7 50 14          	movzwl 0x14(%eax),%edx
  102b40:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b43:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
  102b47:	8b 45 08             	mov    0x8(%ebp),%eax
  102b4a:	0f b7 50 16          	movzwl 0x16(%eax),%edx
  102b4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b51:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
  102b55:	8b 45 08             	mov    0x8(%ebp),%eax
  102b58:	8b 50 18             	mov    0x18(%eax),%edx
  102b5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b5e:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  102b61:	8b 45 08             	mov    0x8(%ebp),%eax
  102b64:	8d 50 1c             	lea    0x1c(%eax),%edx
  102b67:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b6a:	83 c0 0c             	add    $0xc,%eax
  102b6d:	83 ec 04             	sub    $0x4,%esp
  102b70:	6a 34                	push   $0x34
  102b72:	52                   	push   %edx
  102b73:	50                   	push   %eax
  102b74:	e8 ed e3 ff ff       	call   100f66 <memmove>
  102b79:	83 c4 10             	add    $0x10,%esp
  log_write(bp);
  102b7c:	83 ec 0c             	sub    $0xc,%esp
  102b7f:	ff 75 f4             	push   -0xc(%ebp)
  102b82:	e8 aa 14 00 00       	call   104031 <log_write>
  102b87:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  102b8a:	83 ec 0c             	sub    $0xc,%esp
  102b8d:	ff 75 f4             	push   -0xc(%ebp)
  102b90:	e8 7d f6 ff ff       	call   102212 <brelse>
  102b95:	83 c4 10             	add    $0x10,%esp
}
  102b98:	90                   	nop
  102b99:	c9                   	leave
  102b9a:	c3                   	ret

00102b9b <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
struct inode*
iget(uint dev, uint inum)
{
  102b9b:	55                   	push   %ebp
  102b9c:	89 e5                	mov    %esp,%ebp
  102b9e:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip, *empty;

  // Is the inode already cached?
  empty = 0;
  102ba1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
  102ba8:	c7 45 f4 20 e0 10 00 	movl   $0x10e020,-0xc(%ebp)
  102baf:	eb 4d                	jmp    102bfe <iget+0x63>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
  102bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bb4:	8b 40 08             	mov    0x8(%eax),%eax
  102bb7:	85 c0                	test   %eax,%eax
  102bb9:	7e 29                	jle    102be4 <iget+0x49>
  102bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bbe:	8b 00                	mov    (%eax),%eax
  102bc0:	39 45 08             	cmp    %eax,0x8(%ebp)
  102bc3:	75 1f                	jne    102be4 <iget+0x49>
  102bc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bc8:	8b 40 04             	mov    0x4(%eax),%eax
  102bcb:	39 45 0c             	cmp    %eax,0xc(%ebp)
  102bce:	75 14                	jne    102be4 <iget+0x49>
      ip->ref++;
  102bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bd3:	8b 40 08             	mov    0x8(%eax),%eax
  102bd6:	8d 50 01             	lea    0x1(%eax),%edx
  102bd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bdc:	89 50 08             	mov    %edx,0x8(%eax)
      return ip;
  102bdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102be2:	eb 64                	jmp    102c48 <iget+0xad>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
  102be4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102be8:	75 10                	jne    102bfa <iget+0x5f>
  102bea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bed:	8b 40 08             	mov    0x8(%eax),%eax
  102bf0:	85 c0                	test   %eax,%eax
  102bf2:	75 06                	jne    102bfa <iget+0x5f>
      empty = ip;
  102bf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bf7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
  102bfa:	83 45 f4 50          	addl   $0x50,-0xc(%ebp)
  102bfe:	81 7d f4 c0 ef 10 00 	cmpl   $0x10efc0,-0xc(%ebp)
  102c05:	72 aa                	jb     102bb1 <iget+0x16>
  }

  // Recycle an inode cache entry.
  if(empty == 0)
  102c07:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102c0b:	75 0d                	jne    102c1a <iget+0x7f>
    panic("iget: no inodes");
  102c0d:	83 ec 0c             	sub    $0xc,%esp
  102c10:	68 95 44 10 00       	push   $0x104495
  102c15:	e8 93 d6 ff ff       	call   1002ad <panic>

  ip = empty;
  102c1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  ip->dev = dev;
  102c20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c23:	8b 55 08             	mov    0x8(%ebp),%edx
  102c26:	89 10                	mov    %edx,(%eax)
  ip->inum = inum;
  102c28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c2b:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c2e:	89 50 04             	mov    %edx,0x4(%eax)
  ip->ref = 1;
  102c31:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c34:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  ip->valid = 0;
  102c3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c3e:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)

  return ip;
  102c45:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102c48:	c9                   	leave
  102c49:	c3                   	ret

00102c4a <iread>:

// Reads the inode from disk if necessary.
void
iread(struct inode *ip)
{
  102c4a:	55                   	push   %ebp
  102c4b:	89 e5                	mov    %esp,%ebp
  102c4d:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
  102c50:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102c54:	74 0a                	je     102c60 <iread+0x16>
  102c56:	8b 45 08             	mov    0x8(%ebp),%eax
  102c59:	8b 40 08             	mov    0x8(%eax),%eax
  102c5c:	85 c0                	test   %eax,%eax
  102c5e:	7f 0d                	jg     102c6d <iread+0x23>
    panic("iread");
  102c60:	83 ec 0c             	sub    $0xc,%esp
  102c63:	68 a5 44 10 00       	push   $0x1044a5
  102c68:	e8 40 d6 ff ff       	call   1002ad <panic>

  if(ip->valid == 0){
  102c6d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c70:	8b 40 0c             	mov    0xc(%eax),%eax
  102c73:	85 c0                	test   %eax,%eax
  102c75:	0f 85 cd 00 00 00    	jne    102d48 <iread+0xfe>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  102c7b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c7e:	8b 40 04             	mov    0x4(%eax),%eax
  102c81:	c1 e8 03             	shr    $0x3,%eax
  102c84:	89 c2                	mov    %eax,%edx
  102c86:	a1 14 e0 10 00       	mov    0x10e014,%eax
  102c8b:	01 c2                	add    %eax,%edx
  102c8d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c90:	8b 00                	mov    (%eax),%eax
  102c92:	83 ec 08             	sub    $0x8,%esp
  102c95:	52                   	push   %edx
  102c96:	50                   	push   %eax
  102c97:	e8 15 f4 ff ff       	call   1020b1 <bread>
  102c9c:	83 c4 10             	add    $0x10,%esp
  102c9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
  102ca2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ca5:	8d 50 1c             	lea    0x1c(%eax),%edx
  102ca8:	8b 45 08             	mov    0x8(%ebp),%eax
  102cab:	8b 40 04             	mov    0x4(%eax),%eax
  102cae:	83 e0 07             	and    $0x7,%eax
  102cb1:	c1 e0 06             	shl    $0x6,%eax
  102cb4:	01 d0                	add    %edx,%eax
  102cb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    ip->type = dip->type;
  102cb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cbc:	0f b7 10             	movzwl (%eax),%edx
  102cbf:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc2:	66 89 50 10          	mov    %dx,0x10(%eax)
    ip->major = dip->major;
  102cc6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cc9:	0f b7 50 02          	movzwl 0x2(%eax),%edx
  102ccd:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd0:	66 89 50 12          	mov    %dx,0x12(%eax)
    ip->minor = dip->minor;
  102cd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cd7:	0f b7 50 04          	movzwl 0x4(%eax),%edx
  102cdb:	8b 45 08             	mov    0x8(%ebp),%eax
  102cde:	66 89 50 14          	mov    %dx,0x14(%eax)
    ip->nlink = dip->nlink;
  102ce2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ce5:	0f b7 50 06          	movzwl 0x6(%eax),%edx
  102ce9:	8b 45 08             	mov    0x8(%ebp),%eax
  102cec:	66 89 50 16          	mov    %dx,0x16(%eax)
    ip->size = dip->size;
  102cf0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cf3:	8b 50 08             	mov    0x8(%eax),%edx
  102cf6:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf9:	89 50 18             	mov    %edx,0x18(%eax)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
  102cfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cff:	8d 50 0c             	lea    0xc(%eax),%edx
  102d02:	8b 45 08             	mov    0x8(%ebp),%eax
  102d05:	83 c0 1c             	add    $0x1c,%eax
  102d08:	83 ec 04             	sub    $0x4,%esp
  102d0b:	6a 34                	push   $0x34
  102d0d:	52                   	push   %edx
  102d0e:	50                   	push   %eax
  102d0f:	e8 52 e2 ff ff       	call   100f66 <memmove>
  102d14:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  102d17:	83 ec 0c             	sub    $0xc,%esp
  102d1a:	ff 75 f4             	push   -0xc(%ebp)
  102d1d:	e8 f0 f4 ff ff       	call   102212 <brelse>
  102d22:	83 c4 10             	add    $0x10,%esp
    ip->valid = 1;
  102d25:	8b 45 08             	mov    0x8(%ebp),%eax
  102d28:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
    if(ip->type == 0)
  102d2f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d32:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  102d36:	66 85 c0             	test   %ax,%ax
  102d39:	75 0d                	jne    102d48 <iread+0xfe>
      panic("iread: no type");
  102d3b:	83 ec 0c             	sub    $0xc,%esp
  102d3e:	68 ab 44 10 00       	push   $0x1044ab
  102d43:	e8 65 d5 ff ff       	call   1002ad <panic>
  }
}
  102d48:	90                   	nop
  102d49:	c9                   	leave
  102d4a:	c3                   	ret

00102d4b <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
  102d4b:	55                   	push   %ebp
  102d4c:	89 e5                	mov    %esp,%ebp
  102d4e:	83 ec 18             	sub    $0x18,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
  102d51:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
  102d55:	77 42                	ja     102d99 <bmap+0x4e>
    if((addr = ip->addrs[bn]) == 0)
  102d57:	8b 45 08             	mov    0x8(%ebp),%eax
  102d5a:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d5d:	83 c2 04             	add    $0x4,%edx
  102d60:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102d64:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d67:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102d6b:	75 24                	jne    102d91 <bmap+0x46>
      ip->addrs[bn] = addr = balloc(ip->dev);
  102d6d:	8b 45 08             	mov    0x8(%ebp),%eax
  102d70:	8b 00                	mov    (%eax),%eax
  102d72:	83 ec 0c             	sub    $0xc,%esp
  102d75:	50                   	push   %eax
  102d76:	e8 b5 f9 ff ff       	call   102730 <balloc>
  102d7b:	83 c4 10             	add    $0x10,%esp
  102d7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d81:	8b 45 08             	mov    0x8(%ebp),%eax
  102d84:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d87:	8d 4a 04             	lea    0x4(%edx),%ecx
  102d8a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d8d:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    return addr;
  102d91:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d94:	e9 ca 00 00 00       	jmp    102e63 <bmap+0x118>
  }
  bn -= NDIRECT;
  102d99:	83 6d 0c 0c          	subl   $0xc,0xc(%ebp)

  if(bn < NINDIRECT){
  102d9d:	83 7d 0c 7f          	cmpl   $0x7f,0xc(%ebp)
  102da1:	0f 87 af 00 00 00    	ja     102e56 <bmap+0x10b>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
  102da7:	8b 45 08             	mov    0x8(%ebp),%eax
  102daa:	8b 40 4c             	mov    0x4c(%eax),%eax
  102dad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102db0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102db4:	75 1d                	jne    102dd3 <bmap+0x88>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
  102db6:	8b 45 08             	mov    0x8(%ebp),%eax
  102db9:	8b 00                	mov    (%eax),%eax
  102dbb:	83 ec 0c             	sub    $0xc,%esp
  102dbe:	50                   	push   %eax
  102dbf:	e8 6c f9 ff ff       	call   102730 <balloc>
  102dc4:	83 c4 10             	add    $0x10,%esp
  102dc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102dca:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102dd0:	89 50 4c             	mov    %edx,0x4c(%eax)
    bp = bread_wr(ip->dev, addr);
  102dd3:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd6:	8b 00                	mov    (%eax),%eax
  102dd8:	83 ec 08             	sub    $0x8,%esp
  102ddb:	ff 75 f4             	push   -0xc(%ebp)
  102dde:	50                   	push   %eax
  102ddf:	e8 92 f3 ff ff       	call   102176 <bread_wr>
  102de4:	83 c4 10             	add    $0x10,%esp
  102de7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    a = (uint*)bp->data;
  102dea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ded:	83 c0 1c             	add    $0x1c,%eax
  102df0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((addr = a[bn]) == 0){
  102df3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102df6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102dfd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e00:	01 d0                	add    %edx,%eax
  102e02:	8b 00                	mov    (%eax),%eax
  102e04:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e07:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102e0b:	75 36                	jne    102e43 <bmap+0xf8>
      a[bn] = addr = balloc(ip->dev);
  102e0d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e10:	8b 00                	mov    (%eax),%eax
  102e12:	83 ec 0c             	sub    $0xc,%esp
  102e15:	50                   	push   %eax
  102e16:	e8 15 f9 ff ff       	call   102730 <balloc>
  102e1b:	83 c4 10             	add    $0x10,%esp
  102e1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e21:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e24:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102e2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e2e:	01 c2                	add    %eax,%edx
  102e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e33:	89 02                	mov    %eax,(%edx)
      log_write(bp);
  102e35:	83 ec 0c             	sub    $0xc,%esp
  102e38:	ff 75 f0             	push   -0x10(%ebp)
  102e3b:	e8 f1 11 00 00       	call   104031 <log_write>
  102e40:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  102e43:	83 ec 0c             	sub    $0xc,%esp
  102e46:	ff 75 f0             	push   -0x10(%ebp)
  102e49:	e8 c4 f3 ff ff       	call   102212 <brelse>
  102e4e:	83 c4 10             	add    $0x10,%esp
    return addr;
  102e51:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e54:	eb 0d                	jmp    102e63 <bmap+0x118>
  }

  panic("bmap: out of range");
  102e56:	83 ec 0c             	sub    $0xc,%esp
  102e59:	68 ba 44 10 00       	push   $0x1044ba
  102e5e:	e8 4a d4 ff ff       	call   1002ad <panic>
}
  102e63:	c9                   	leave
  102e64:	c3                   	ret

00102e65 <itrunc>:
// to it (no directory entries referring to it)
// and has no in-memory reference to it (is
// not an open file or current directory).
static void
itrunc(struct inode *ip)
{
  102e65:	55                   	push   %ebp
  102e66:	89 e5                	mov    %esp,%ebp
  102e68:	83 ec 18             	sub    $0x18,%esp
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
  102e6b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102e72:	eb 45                	jmp    102eb9 <itrunc+0x54>
    if(ip->addrs[i]){
  102e74:	8b 45 08             	mov    0x8(%ebp),%eax
  102e77:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e7a:	83 c2 04             	add    $0x4,%edx
  102e7d:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102e81:	85 c0                	test   %eax,%eax
  102e83:	74 30                	je     102eb5 <itrunc+0x50>
      bfree(ip->dev, ip->addrs[i]);
  102e85:	8b 45 08             	mov    0x8(%ebp),%eax
  102e88:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e8b:	83 c2 04             	add    $0x4,%edx
  102e8e:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102e92:	8b 55 08             	mov    0x8(%ebp),%edx
  102e95:	8b 12                	mov    (%edx),%edx
  102e97:	83 ec 08             	sub    $0x8,%esp
  102e9a:	50                   	push   %eax
  102e9b:	52                   	push   %edx
  102e9c:	e8 d3 f9 ff ff       	call   102874 <bfree>
  102ea1:	83 c4 10             	add    $0x10,%esp
      ip->addrs[i] = 0;
  102ea4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ea7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102eaa:	83 c2 04             	add    $0x4,%edx
  102ead:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
  102eb4:	00 
  for(i = 0; i < NDIRECT; i++){
  102eb5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  102eb9:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
  102ebd:	7e b5                	jle    102e74 <itrunc+0xf>
    }
  }

  if(ip->addrs[NDIRECT]){
  102ebf:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec2:	8b 40 4c             	mov    0x4c(%eax),%eax
  102ec5:	85 c0                	test   %eax,%eax
  102ec7:	0f 84 a1 00 00 00    	je     102f6e <itrunc+0x109>
    bp = bread_wr(ip->dev, ip->addrs[NDIRECT]);
  102ecd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed0:	8b 50 4c             	mov    0x4c(%eax),%edx
  102ed3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed6:	8b 00                	mov    (%eax),%eax
  102ed8:	83 ec 08             	sub    $0x8,%esp
  102edb:	52                   	push   %edx
  102edc:	50                   	push   %eax
  102edd:	e8 94 f2 ff ff       	call   102176 <bread_wr>
  102ee2:	83 c4 10             	add    $0x10,%esp
  102ee5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    a = (uint*)bp->data;
  102ee8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102eeb:	83 c0 1c             	add    $0x1c,%eax
  102eee:	89 45 e8             	mov    %eax,-0x18(%ebp)
    for(j = 0; j < NINDIRECT; j++){
  102ef1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  102ef8:	eb 3c                	jmp    102f36 <itrunc+0xd1>
      if(a[j])
  102efa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102efd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102f04:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f07:	01 d0                	add    %edx,%eax
  102f09:	8b 00                	mov    (%eax),%eax
  102f0b:	85 c0                	test   %eax,%eax
  102f0d:	74 23                	je     102f32 <itrunc+0xcd>
        bfree(ip->dev, a[j]);
  102f0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f12:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102f19:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f1c:	01 d0                	add    %edx,%eax
  102f1e:	8b 00                	mov    (%eax),%eax
  102f20:	8b 55 08             	mov    0x8(%ebp),%edx
  102f23:	8b 12                	mov    (%edx),%edx
  102f25:	83 ec 08             	sub    $0x8,%esp
  102f28:	50                   	push   %eax
  102f29:	52                   	push   %edx
  102f2a:	e8 45 f9 ff ff       	call   102874 <bfree>
  102f2f:	83 c4 10             	add    $0x10,%esp
    for(j = 0; j < NINDIRECT; j++){
  102f32:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  102f36:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f39:	83 f8 7f             	cmp    $0x7f,%eax
  102f3c:	76 bc                	jbe    102efa <itrunc+0x95>
    }
    brelse(bp);
  102f3e:	83 ec 0c             	sub    $0xc,%esp
  102f41:	ff 75 ec             	push   -0x14(%ebp)
  102f44:	e8 c9 f2 ff ff       	call   102212 <brelse>
  102f49:	83 c4 10             	add    $0x10,%esp
    bfree(ip->dev, ip->addrs[NDIRECT]);
  102f4c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f4f:	8b 40 4c             	mov    0x4c(%eax),%eax
  102f52:	8b 55 08             	mov    0x8(%ebp),%edx
  102f55:	8b 12                	mov    (%edx),%edx
  102f57:	83 ec 08             	sub    $0x8,%esp
  102f5a:	50                   	push   %eax
  102f5b:	52                   	push   %edx
  102f5c:	e8 13 f9 ff ff       	call   102874 <bfree>
  102f61:	83 c4 10             	add    $0x10,%esp
    ip->addrs[NDIRECT] = 0;
  102f64:	8b 45 08             	mov    0x8(%ebp),%eax
  102f67:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
  }

  ip->size = 0;
  102f6e:	8b 45 08             	mov    0x8(%ebp),%eax
  102f71:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  iupdate(ip);
  102f78:	83 ec 0c             	sub    $0xc,%esp
  102f7b:	ff 75 08             	push   0x8(%ebp)
  102f7e:	e8 57 fb ff ff       	call   102ada <iupdate>
  102f83:	83 c4 10             	add    $0x10,%esp
}
  102f86:	90                   	nop
  102f87:	c9                   	leave
  102f88:	c3                   	ret

00102f89 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
  102f89:	55                   	push   %ebp
  102f8a:	89 e5                	mov    %esp,%ebp
  st->dev = ip->dev;
  102f8c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f8f:	8b 00                	mov    (%eax),%eax
  102f91:	89 c2                	mov    %eax,%edx
  102f93:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f96:	89 50 04             	mov    %edx,0x4(%eax)
  st->ino = ip->inum;
  102f99:	8b 45 08             	mov    0x8(%ebp),%eax
  102f9c:	8b 50 04             	mov    0x4(%eax),%edx
  102f9f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fa2:	89 50 08             	mov    %edx,0x8(%eax)
  st->type = ip->type;
  102fa5:	8b 45 08             	mov    0x8(%ebp),%eax
  102fa8:	0f b7 50 10          	movzwl 0x10(%eax),%edx
  102fac:	8b 45 0c             	mov    0xc(%ebp),%eax
  102faf:	66 89 10             	mov    %dx,(%eax)
  st->nlink = ip->nlink;
  102fb2:	8b 45 08             	mov    0x8(%ebp),%eax
  102fb5:	0f b7 50 16          	movzwl 0x16(%eax),%edx
  102fb9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fbc:	66 89 50 0c          	mov    %dx,0xc(%eax)
  st->size = ip->size;
  102fc0:	8b 45 08             	mov    0x8(%ebp),%eax
  102fc3:	8b 50 18             	mov    0x18(%eax),%edx
  102fc6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fc9:	89 50 10             	mov    %edx,0x10(%eax)
}
  102fcc:	90                   	nop
  102fcd:	5d                   	pop    %ebp
  102fce:	c3                   	ret

00102fcf <readi>:

// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
  102fcf:	55                   	push   %ebp
  102fd0:	89 e5                	mov    %esp,%ebp
  102fd2:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off || ip->nlink < 1)
  102fd5:	8b 45 08             	mov    0x8(%ebp),%eax
  102fd8:	8b 40 18             	mov    0x18(%eax),%eax
  102fdb:	39 45 10             	cmp    %eax,0x10(%ebp)
  102fde:	77 19                	ja     102ff9 <readi+0x2a>
  102fe0:	8b 55 10             	mov    0x10(%ebp),%edx
  102fe3:	8b 45 14             	mov    0x14(%ebp),%eax
  102fe6:	01 d0                	add    %edx,%eax
  102fe8:	39 45 10             	cmp    %eax,0x10(%ebp)
  102feb:	77 0c                	ja     102ff9 <readi+0x2a>
  102fed:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff0:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  102ff4:	66 85 c0             	test   %ax,%ax
  102ff7:	7f 0a                	jg     103003 <readi+0x34>
    return -1;
  102ff9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102ffe:	e9 c2 00 00 00       	jmp    1030c5 <readi+0xf6>
  if(off + n > ip->size)
  103003:	8b 55 10             	mov    0x10(%ebp),%edx
  103006:	8b 45 14             	mov    0x14(%ebp),%eax
  103009:	01 c2                	add    %eax,%edx
  10300b:	8b 45 08             	mov    0x8(%ebp),%eax
  10300e:	8b 40 18             	mov    0x18(%eax),%eax
  103011:	39 c2                	cmp    %eax,%edx
  103013:	76 0c                	jbe    103021 <readi+0x52>
    n = ip->size - off;
  103015:	8b 45 08             	mov    0x8(%ebp),%eax
  103018:	8b 40 18             	mov    0x18(%eax),%eax
  10301b:	2b 45 10             	sub    0x10(%ebp),%eax
  10301e:	89 45 14             	mov    %eax,0x14(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  103021:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103028:	e9 89 00 00 00       	jmp    1030b6 <readi+0xe7>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
  10302d:	8b 45 10             	mov    0x10(%ebp),%eax
  103030:	c1 e8 09             	shr    $0x9,%eax
  103033:	83 ec 08             	sub    $0x8,%esp
  103036:	50                   	push   %eax
  103037:	ff 75 08             	push   0x8(%ebp)
  10303a:	e8 0c fd ff ff       	call   102d4b <bmap>
  10303f:	83 c4 10             	add    $0x10,%esp
  103042:	8b 55 08             	mov    0x8(%ebp),%edx
  103045:	8b 12                	mov    (%edx),%edx
  103047:	83 ec 08             	sub    $0x8,%esp
  10304a:	50                   	push   %eax
  10304b:	52                   	push   %edx
  10304c:	e8 60 f0 ff ff       	call   1020b1 <bread>
  103051:	83 c4 10             	add    $0x10,%esp
  103054:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
  103057:	8b 45 10             	mov    0x10(%ebp),%eax
  10305a:	25 ff 01 00 00       	and    $0x1ff,%eax
  10305f:	ba 00 02 00 00       	mov    $0x200,%edx
  103064:	29 c2                	sub    %eax,%edx
  103066:	8b 45 14             	mov    0x14(%ebp),%eax
  103069:	2b 45 f4             	sub    -0xc(%ebp),%eax
  10306c:	39 c2                	cmp    %eax,%edx
  10306e:	0f 46 c2             	cmovbe %edx,%eax
  103071:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(dst, bp->data + off%BSIZE, m);
  103074:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103077:	8d 50 1c             	lea    0x1c(%eax),%edx
  10307a:	8b 45 10             	mov    0x10(%ebp),%eax
  10307d:	25 ff 01 00 00       	and    $0x1ff,%eax
  103082:	01 d0                	add    %edx,%eax
  103084:	83 ec 04             	sub    $0x4,%esp
  103087:	ff 75 ec             	push   -0x14(%ebp)
  10308a:	50                   	push   %eax
  10308b:	ff 75 0c             	push   0xc(%ebp)
  10308e:	e8 d3 de ff ff       	call   100f66 <memmove>
  103093:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  103096:	83 ec 0c             	sub    $0xc,%esp
  103099:	ff 75 f0             	push   -0x10(%ebp)
  10309c:	e8 71 f1 ff ff       	call   102212 <brelse>
  1030a1:	83 c4 10             	add    $0x10,%esp
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  1030a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1030a7:	01 45 f4             	add    %eax,-0xc(%ebp)
  1030aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1030ad:	01 45 10             	add    %eax,0x10(%ebp)
  1030b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1030b3:	01 45 0c             	add    %eax,0xc(%ebp)
  1030b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030b9:	3b 45 14             	cmp    0x14(%ebp),%eax
  1030bc:	0f 82 6b ff ff ff    	jb     10302d <readi+0x5e>
  }
  return n;
  1030c2:	8b 45 14             	mov    0x14(%ebp),%eax
}
  1030c5:	c9                   	leave
  1030c6:	c3                   	ret

001030c7 <writei>:

// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
  1030c7:	55                   	push   %ebp
  1030c8:	89 e5                	mov    %esp,%ebp
  1030ca:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
  1030cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d0:	8b 40 18             	mov    0x18(%eax),%eax
  1030d3:	39 45 10             	cmp    %eax,0x10(%ebp)
  1030d6:	77 0d                	ja     1030e5 <writei+0x1e>
  1030d8:	8b 55 10             	mov    0x10(%ebp),%edx
  1030db:	8b 45 14             	mov    0x14(%ebp),%eax
  1030de:	01 d0                	add    %edx,%eax
  1030e0:	39 45 10             	cmp    %eax,0x10(%ebp)
  1030e3:	76 0a                	jbe    1030ef <writei+0x28>
    return -1;
  1030e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1030ea:	e9 f3 00 00 00       	jmp    1031e2 <writei+0x11b>
  if(off + n > MAXFILE*BSIZE)
  1030ef:	8b 55 10             	mov    0x10(%ebp),%edx
  1030f2:	8b 45 14             	mov    0x14(%ebp),%eax
  1030f5:	01 d0                	add    %edx,%eax
  1030f7:	3d 00 18 01 00       	cmp    $0x11800,%eax
  1030fc:	76 0a                	jbe    103108 <writei+0x41>
    return -1;
  1030fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103103:	e9 da 00 00 00       	jmp    1031e2 <writei+0x11b>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  103108:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10310f:	e9 97 00 00 00       	jmp    1031ab <writei+0xe4>
    bp = bread_wr(ip->dev, bmap(ip, off/BSIZE));
  103114:	8b 45 10             	mov    0x10(%ebp),%eax
  103117:	c1 e8 09             	shr    $0x9,%eax
  10311a:	83 ec 08             	sub    $0x8,%esp
  10311d:	50                   	push   %eax
  10311e:	ff 75 08             	push   0x8(%ebp)
  103121:	e8 25 fc ff ff       	call   102d4b <bmap>
  103126:	83 c4 10             	add    $0x10,%esp
  103129:	8b 55 08             	mov    0x8(%ebp),%edx
  10312c:	8b 12                	mov    (%edx),%edx
  10312e:	83 ec 08             	sub    $0x8,%esp
  103131:	50                   	push   %eax
  103132:	52                   	push   %edx
  103133:	e8 3e f0 ff ff       	call   102176 <bread_wr>
  103138:	83 c4 10             	add    $0x10,%esp
  10313b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
  10313e:	8b 45 10             	mov    0x10(%ebp),%eax
  103141:	25 ff 01 00 00       	and    $0x1ff,%eax
  103146:	ba 00 02 00 00       	mov    $0x200,%edx
  10314b:	29 c2                	sub    %eax,%edx
  10314d:	8b 45 14             	mov    0x14(%ebp),%eax
  103150:	2b 45 f4             	sub    -0xc(%ebp),%eax
  103153:	39 c2                	cmp    %eax,%edx
  103155:	0f 46 c2             	cmovbe %edx,%eax
  103158:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(bp->data + off%BSIZE, src, m);
  10315b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10315e:	8d 50 1c             	lea    0x1c(%eax),%edx
  103161:	8b 45 10             	mov    0x10(%ebp),%eax
  103164:	25 ff 01 00 00       	and    $0x1ff,%eax
  103169:	01 d0                	add    %edx,%eax
  10316b:	83 ec 04             	sub    $0x4,%esp
  10316e:	ff 75 ec             	push   -0x14(%ebp)
  103171:	ff 75 0c             	push   0xc(%ebp)
  103174:	50                   	push   %eax
  103175:	e8 ec dd ff ff       	call   100f66 <memmove>
  10317a:	83 c4 10             	add    $0x10,%esp
    log_write(bp);
  10317d:	83 ec 0c             	sub    $0xc,%esp
  103180:	ff 75 f0             	push   -0x10(%ebp)
  103183:	e8 a9 0e 00 00       	call   104031 <log_write>
  103188:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  10318b:	83 ec 0c             	sub    $0xc,%esp
  10318e:	ff 75 f0             	push   -0x10(%ebp)
  103191:	e8 7c f0 ff ff       	call   102212 <brelse>
  103196:	83 c4 10             	add    $0x10,%esp
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  103199:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10319c:	01 45 f4             	add    %eax,-0xc(%ebp)
  10319f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031a2:	01 45 10             	add    %eax,0x10(%ebp)
  1031a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031a8:	01 45 0c             	add    %eax,0xc(%ebp)
  1031ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1031ae:	3b 45 14             	cmp    0x14(%ebp),%eax
  1031b1:	0f 82 5d ff ff ff    	jb     103114 <writei+0x4d>
  }

  if(n > 0 && off > ip->size){
  1031b7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1031bb:	74 22                	je     1031df <writei+0x118>
  1031bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c0:	8b 40 18             	mov    0x18(%eax),%eax
  1031c3:	39 45 10             	cmp    %eax,0x10(%ebp)
  1031c6:	76 17                	jbe    1031df <writei+0x118>
    ip->size = off;
  1031c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1031cb:	8b 55 10             	mov    0x10(%ebp),%edx
  1031ce:	89 50 18             	mov    %edx,0x18(%eax)
    iupdate(ip);
  1031d1:	83 ec 0c             	sub    $0xc,%esp
  1031d4:	ff 75 08             	push   0x8(%ebp)
  1031d7:	e8 fe f8 ff ff       	call   102ada <iupdate>
  1031dc:	83 c4 10             	add    $0x10,%esp
  }
  return n;
  1031df:	8b 45 14             	mov    0x14(%ebp),%eax
}
  1031e2:	c9                   	leave
  1031e3:	c3                   	ret

001031e4 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
  1031e4:	55                   	push   %ebp
  1031e5:	89 e5                	mov    %esp,%ebp
  1031e7:	83 ec 08             	sub    $0x8,%esp
  return strncmp(s, t, DIRSIZ);
  1031ea:	83 ec 04             	sub    $0x4,%esp
  1031ed:	6a 0e                	push   $0xe
  1031ef:	ff 75 0c             	push   0xc(%ebp)
  1031f2:	ff 75 08             	push   0x8(%ebp)
  1031f5:	e8 02 de ff ff       	call   100ffc <strncmp>
  1031fa:	83 c4 10             	add    $0x10,%esp
}
  1031fd:	c9                   	leave
  1031fe:	c3                   	ret

001031ff <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
  1031ff:	55                   	push   %ebp
  103200:	89 e5                	mov    %esp,%ebp
  103202:	83 ec 28             	sub    $0x28,%esp
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
  103205:	8b 45 08             	mov    0x8(%ebp),%eax
  103208:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  10320c:	66 83 f8 01          	cmp    $0x1,%ax
  103210:	74 0d                	je     10321f <dirlookup+0x20>
    panic("dirlookup not DIR");
  103212:	83 ec 0c             	sub    $0xc,%esp
  103215:	68 cd 44 10 00       	push   $0x1044cd
  10321a:	e8 8e d0 ff ff       	call   1002ad <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
  10321f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103226:	eb 7b                	jmp    1032a3 <dirlookup+0xa4>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103228:	6a 10                	push   $0x10
  10322a:	ff 75 f4             	push   -0xc(%ebp)
  10322d:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103230:	50                   	push   %eax
  103231:	ff 75 08             	push   0x8(%ebp)
  103234:	e8 96 fd ff ff       	call   102fcf <readi>
  103239:	83 c4 10             	add    $0x10,%esp
  10323c:	83 f8 10             	cmp    $0x10,%eax
  10323f:	74 0d                	je     10324e <dirlookup+0x4f>
      panic("dirlookup read");
  103241:	83 ec 0c             	sub    $0xc,%esp
  103244:	68 df 44 10 00       	push   $0x1044df
  103249:	e8 5f d0 ff ff       	call   1002ad <panic>
    if(de.inum == 0)
  10324e:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  103252:	66 85 c0             	test   %ax,%ax
  103255:	74 47                	je     10329e <dirlookup+0x9f>
      continue;
    if(namecmp(name, de.name) == 0){
  103257:	83 ec 08             	sub    $0x8,%esp
  10325a:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10325d:	83 c0 02             	add    $0x2,%eax
  103260:	50                   	push   %eax
  103261:	ff 75 0c             	push   0xc(%ebp)
  103264:	e8 7b ff ff ff       	call   1031e4 <namecmp>
  103269:	83 c4 10             	add    $0x10,%esp
  10326c:	85 c0                	test   %eax,%eax
  10326e:	75 2f                	jne    10329f <dirlookup+0xa0>
      // entry matches path element
      if(poff)
  103270:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103274:	74 08                	je     10327e <dirlookup+0x7f>
        *poff = off;
  103276:	8b 45 10             	mov    0x10(%ebp),%eax
  103279:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10327c:	89 10                	mov    %edx,(%eax)
      inum = de.inum;
  10327e:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  103282:	0f b7 c0             	movzwl %ax,%eax
  103285:	89 45 f0             	mov    %eax,-0x10(%ebp)
      return iget(dp->dev, inum);
  103288:	8b 45 08             	mov    0x8(%ebp),%eax
  10328b:	8b 00                	mov    (%eax),%eax
  10328d:	83 ec 08             	sub    $0x8,%esp
  103290:	ff 75 f0             	push   -0x10(%ebp)
  103293:	50                   	push   %eax
  103294:	e8 02 f9 ff ff       	call   102b9b <iget>
  103299:	83 c4 10             	add    $0x10,%esp
  10329c:	eb 19                	jmp    1032b7 <dirlookup+0xb8>
      continue;
  10329e:	90                   	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
  10329f:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  1032a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a6:	8b 40 18             	mov    0x18(%eax),%eax
  1032a9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1032ac:	0f 82 76 ff ff ff    	jb     103228 <dirlookup+0x29>
    }
  }

  return 0;
  1032b2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032b7:	c9                   	leave
  1032b8:	c3                   	ret

001032b9 <dirlink>:


// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
  1032b9:	55                   	push   %ebp
  1032ba:	89 e5                	mov    %esp,%ebp
  1032bc:	83 ec 28             	sub    $0x28,%esp
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
  1032bf:	83 ec 04             	sub    $0x4,%esp
  1032c2:	6a 00                	push   $0x0
  1032c4:	ff 75 0c             	push   0xc(%ebp)
  1032c7:	ff 75 08             	push   0x8(%ebp)
  1032ca:	e8 30 ff ff ff       	call   1031ff <dirlookup>
  1032cf:	83 c4 10             	add    $0x10,%esp
  1032d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032d5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1032d9:	74 18                	je     1032f3 <dirlink+0x3a>
    iput(ip);
  1032db:	83 ec 0c             	sub    $0xc,%esp
  1032de:	ff 75 f0             	push   -0x10(%ebp)
  1032e1:	e8 88 f7 ff ff       	call   102a6e <iput>
  1032e6:	83 c4 10             	add    $0x10,%esp
    return -1;
  1032e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1032ee:	e9 9c 00 00 00       	jmp    10338f <dirlink+0xd6>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
  1032f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1032fa:	eb 39                	jmp    103335 <dirlink+0x7c>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  1032fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1032ff:	6a 10                	push   $0x10
  103301:	50                   	push   %eax
  103302:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103305:	50                   	push   %eax
  103306:	ff 75 08             	push   0x8(%ebp)
  103309:	e8 c1 fc ff ff       	call   102fcf <readi>
  10330e:	83 c4 10             	add    $0x10,%esp
  103311:	83 f8 10             	cmp    $0x10,%eax
  103314:	74 0d                	je     103323 <dirlink+0x6a>
      panic("dirlink read");
  103316:	83 ec 0c             	sub    $0xc,%esp
  103319:	68 ee 44 10 00       	push   $0x1044ee
  10331e:	e8 8a cf ff ff       	call   1002ad <panic>
    if(de.inum == 0)
  103323:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  103327:	66 85 c0             	test   %ax,%ax
  10332a:	74 18                	je     103344 <dirlink+0x8b>
  for(off = 0; off < dp->size; off += sizeof(de)){
  10332c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10332f:	83 c0 10             	add    $0x10,%eax
  103332:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103335:	8b 45 08             	mov    0x8(%ebp),%eax
  103338:	8b 50 18             	mov    0x18(%eax),%edx
  10333b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10333e:	39 c2                	cmp    %eax,%edx
  103340:	77 ba                	ja     1032fc <dirlink+0x43>
  103342:	eb 01                	jmp    103345 <dirlink+0x8c>
      break;
  103344:	90                   	nop
  }

  strncpy(de.name, name, DIRSIZ);
  103345:	83 ec 04             	sub    $0x4,%esp
  103348:	6a 0e                	push   $0xe
  10334a:	ff 75 0c             	push   0xc(%ebp)
  10334d:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103350:	83 c0 02             	add    $0x2,%eax
  103353:	50                   	push   %eax
  103354:	e8 f9 dc ff ff       	call   101052 <strncpy>
  103359:	83 c4 10             	add    $0x10,%esp
  de.inum = inum;
  10335c:	8b 45 10             	mov    0x10(%ebp),%eax
  10335f:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103363:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103366:	6a 10                	push   $0x10
  103368:	50                   	push   %eax
  103369:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10336c:	50                   	push   %eax
  10336d:	ff 75 08             	push   0x8(%ebp)
  103370:	e8 52 fd ff ff       	call   1030c7 <writei>
  103375:	83 c4 10             	add    $0x10,%esp
  103378:	83 f8 10             	cmp    $0x10,%eax
  10337b:	74 0d                	je     10338a <dirlink+0xd1>
    panic("dirlink");
  10337d:	83 ec 0c             	sub    $0xc,%esp
  103380:	68 fb 44 10 00       	push   $0x1044fb
  103385:	e8 23 cf ff ff       	call   1002ad <panic>

  return 0;
  10338a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10338f:	c9                   	leave
  103390:	c3                   	ret

00103391 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
  103391:	55                   	push   %ebp
  103392:	89 e5                	mov    %esp,%ebp
  103394:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int len;

  while(*path == '/')
  103397:	eb 04                	jmp    10339d <skipelem+0xc>
    path++;
  103399:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
  10339d:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a0:	0f b6 00             	movzbl (%eax),%eax
  1033a3:	3c 2f                	cmp    $0x2f,%al
  1033a5:	74 f2                	je     103399 <skipelem+0x8>
  if(*path == 0)
  1033a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1033aa:	0f b6 00             	movzbl (%eax),%eax
  1033ad:	84 c0                	test   %al,%al
  1033af:	75 07                	jne    1033b8 <skipelem+0x27>
    return 0;
  1033b1:	b8 00 00 00 00       	mov    $0x0,%eax
  1033b6:	eb 77                	jmp    10342f <skipelem+0x9e>
  s = path;
  1033b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1033bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(*path != '/' && *path != 0)
  1033be:	eb 04                	jmp    1033c4 <skipelem+0x33>
    path++;
  1033c0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path != '/' && *path != 0)
  1033c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c7:	0f b6 00             	movzbl (%eax),%eax
  1033ca:	3c 2f                	cmp    $0x2f,%al
  1033cc:	74 0a                	je     1033d8 <skipelem+0x47>
  1033ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1033d1:	0f b6 00             	movzbl (%eax),%eax
  1033d4:	84 c0                	test   %al,%al
  1033d6:	75 e8                	jne    1033c0 <skipelem+0x2f>
  len = path - s;
  1033d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1033db:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1033de:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(len >= DIRSIZ)
  1033e1:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1033e5:	7e 15                	jle    1033fc <skipelem+0x6b>
    memmove(name, s, DIRSIZ);
  1033e7:	83 ec 04             	sub    $0x4,%esp
  1033ea:	6a 0e                	push   $0xe
  1033ec:	ff 75 f4             	push   -0xc(%ebp)
  1033ef:	ff 75 0c             	push   0xc(%ebp)
  1033f2:	e8 6f db ff ff       	call   100f66 <memmove>
  1033f7:	83 c4 10             	add    $0x10,%esp
  1033fa:	eb 26                	jmp    103422 <skipelem+0x91>
  else {
    memmove(name, s, len);
  1033fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033ff:	83 ec 04             	sub    $0x4,%esp
  103402:	50                   	push   %eax
  103403:	ff 75 f4             	push   -0xc(%ebp)
  103406:	ff 75 0c             	push   0xc(%ebp)
  103409:	e8 58 db ff ff       	call   100f66 <memmove>
  10340e:	83 c4 10             	add    $0x10,%esp
    name[len] = 0;
  103411:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103414:	8b 45 0c             	mov    0xc(%ebp),%eax
  103417:	01 d0                	add    %edx,%eax
  103419:	c6 00 00             	movb   $0x0,(%eax)
  }
  while(*path == '/')
  10341c:	eb 04                	jmp    103422 <skipelem+0x91>
    path++;
  10341e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
  103422:	8b 45 08             	mov    0x8(%ebp),%eax
  103425:	0f b6 00             	movzbl (%eax),%eax
  103428:	3c 2f                	cmp    $0x2f,%al
  10342a:	74 f2                	je     10341e <skipelem+0x8d>
  return path;
  10342c:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10342f:	c9                   	leave
  103430:	c3                   	ret

00103431 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
  103431:	55                   	push   %ebp
  103432:	89 e5                	mov    %esp,%ebp
  103434:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip, *next;

  ip = iget(ROOTDEV, ROOTINO);
  103437:	83 ec 08             	sub    $0x8,%esp
  10343a:	6a 01                	push   $0x1
  10343c:	6a 01                	push   $0x1
  10343e:	e8 58 f7 ff ff       	call   102b9b <iget>
  103443:	83 c4 10             	add    $0x10,%esp
  103446:	89 45 f4             	mov    %eax,-0xc(%ebp)

  while((path = skipelem(path, name)) != 0){
  103449:	e9 90 00 00 00       	jmp    1034de <namex+0xad>
    iread(ip);
  10344e:	83 ec 0c             	sub    $0xc,%esp
  103451:	ff 75 f4             	push   -0xc(%ebp)
  103454:	e8 f1 f7 ff ff       	call   102c4a <iread>
  103459:	83 c4 10             	add    $0x10,%esp
    if(ip->type != T_DIR){
  10345c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10345f:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103463:	66 83 f8 01          	cmp    $0x1,%ax
  103467:	74 18                	je     103481 <namex+0x50>
      iput(ip);
  103469:	83 ec 0c             	sub    $0xc,%esp
  10346c:	ff 75 f4             	push   -0xc(%ebp)
  10346f:	e8 fa f5 ff ff       	call   102a6e <iput>
  103474:	83 c4 10             	add    $0x10,%esp
      return 0;
  103477:	b8 00 00 00 00       	mov    $0x0,%eax
  10347c:	e9 99 00 00 00       	jmp    10351a <namex+0xe9>
    }
    if(nameiparent && *path == '\0'){
  103481:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103485:	74 12                	je     103499 <namex+0x68>
  103487:	8b 45 08             	mov    0x8(%ebp),%eax
  10348a:	0f b6 00             	movzbl (%eax),%eax
  10348d:	84 c0                	test   %al,%al
  10348f:	75 08                	jne    103499 <namex+0x68>
      // Stop one level early.
      return ip;
  103491:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103494:	e9 81 00 00 00       	jmp    10351a <namex+0xe9>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
  103499:	83 ec 04             	sub    $0x4,%esp
  10349c:	6a 00                	push   $0x0
  10349e:	ff 75 10             	push   0x10(%ebp)
  1034a1:	ff 75 f4             	push   -0xc(%ebp)
  1034a4:	e8 56 fd ff ff       	call   1031ff <dirlookup>
  1034a9:	83 c4 10             	add    $0x10,%esp
  1034ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034af:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1034b3:	75 15                	jne    1034ca <namex+0x99>
      iput(ip);
  1034b5:	83 ec 0c             	sub    $0xc,%esp
  1034b8:	ff 75 f4             	push   -0xc(%ebp)
  1034bb:	e8 ae f5 ff ff       	call   102a6e <iput>
  1034c0:	83 c4 10             	add    $0x10,%esp
      return 0;
  1034c3:	b8 00 00 00 00       	mov    $0x0,%eax
  1034c8:	eb 50                	jmp    10351a <namex+0xe9>
    }
    iput(ip);
  1034ca:	83 ec 0c             	sub    $0xc,%esp
  1034cd:	ff 75 f4             	push   -0xc(%ebp)
  1034d0:	e8 99 f5 ff ff       	call   102a6e <iput>
  1034d5:	83 c4 10             	add    $0x10,%esp
    ip = next;
  1034d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while((path = skipelem(path, name)) != 0){
  1034de:	83 ec 08             	sub    $0x8,%esp
  1034e1:	ff 75 10             	push   0x10(%ebp)
  1034e4:	ff 75 08             	push   0x8(%ebp)
  1034e7:	e8 a5 fe ff ff       	call   103391 <skipelem>
  1034ec:	83 c4 10             	add    $0x10,%esp
  1034ef:	89 45 08             	mov    %eax,0x8(%ebp)
  1034f2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1034f6:	0f 85 52 ff ff ff    	jne    10344e <namex+0x1d>
  }
  if(nameiparent){
  1034fc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103500:	74 15                	je     103517 <namex+0xe6>
    iput(ip);
  103502:	83 ec 0c             	sub    $0xc,%esp
  103505:	ff 75 f4             	push   -0xc(%ebp)
  103508:	e8 61 f5 ff ff       	call   102a6e <iput>
  10350d:	83 c4 10             	add    $0x10,%esp
    return 0;
  103510:	b8 00 00 00 00       	mov    $0x0,%eax
  103515:	eb 03                	jmp    10351a <namex+0xe9>
  }
  return ip;
  103517:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10351a:	c9                   	leave
  10351b:	c3                   	ret

0010351c <namei>:

struct inode*
namei(char *path)
{
  10351c:	55                   	push   %ebp
  10351d:	89 e5                	mov    %esp,%ebp
  10351f:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
  103522:	83 ec 04             	sub    $0x4,%esp
  103525:	8d 45 ea             	lea    -0x16(%ebp),%eax
  103528:	50                   	push   %eax
  103529:	6a 00                	push   $0x0
  10352b:	ff 75 08             	push   0x8(%ebp)
  10352e:	e8 fe fe ff ff       	call   103431 <namex>
  103533:	83 c4 10             	add    $0x10,%esp
}
  103536:	c9                   	leave
  103537:	c3                   	ret

00103538 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
  103538:	55                   	push   %ebp
  103539:	89 e5                	mov    %esp,%ebp
  10353b:	83 ec 08             	sub    $0x8,%esp
  return namex(path, 1, name);
  10353e:	83 ec 04             	sub    $0x4,%esp
  103541:	ff 75 0c             	push   0xc(%ebp)
  103544:	6a 01                	push   $0x1
  103546:	ff 75 08             	push   0x8(%ebp)
  103549:	e8 e3 fe ff ff       	call   103431 <namex>
  10354e:	83 c4 10             	add    $0x10,%esp
}
  103551:	c9                   	leave
  103552:	c3                   	ret

00103553 <filealloc>:
} ftable;

// Allocate a file structure.
struct file*
filealloc(void)
{
  103553:	55                   	push   %ebp
  103554:	89 e5                	mov    %esp,%ebp
  103556:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  for(f = ftable.file; f < ftable.file + NFILE; f++){
  103559:	c7 45 fc c0 ef 10 00 	movl   $0x10efc0,-0x4(%ebp)
  103560:	eb 1d                	jmp    10357f <filealloc+0x2c>
    if(f->ref == 0){
  103562:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103565:	8b 40 04             	mov    0x4(%eax),%eax
  103568:	85 c0                	test   %eax,%eax
  10356a:	75 0f                	jne    10357b <filealloc+0x28>
      f->ref = 1;
  10356c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10356f:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
      return f;
  103576:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103579:	eb 13                	jmp    10358e <filealloc+0x3b>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
  10357b:	83 45 fc 14          	addl   $0x14,-0x4(%ebp)
  10357f:	b8 90 f7 10 00       	mov    $0x10f790,%eax
  103584:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  103587:	72 d9                	jb     103562 <filealloc+0xf>
    }
  }
  return 0;
  103589:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10358e:	c9                   	leave
  10358f:	c3                   	ret

00103590 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
  103590:	55                   	push   %ebp
  103591:	89 e5                	mov    %esp,%ebp
  103593:	83 ec 08             	sub    $0x8,%esp
  if(f->ref < 1)
  103596:	8b 45 08             	mov    0x8(%ebp),%eax
  103599:	8b 40 04             	mov    0x4(%eax),%eax
  10359c:	85 c0                	test   %eax,%eax
  10359e:	7f 0d                	jg     1035ad <filedup+0x1d>
    panic("filedup");
  1035a0:	83 ec 0c             	sub    $0xc,%esp
  1035a3:	68 03 45 10 00       	push   $0x104503
  1035a8:	e8 00 cd ff ff       	call   1002ad <panic>
  f->ref++;
  1035ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1035b0:	8b 40 04             	mov    0x4(%eax),%eax
  1035b3:	8d 50 01             	lea    0x1(%eax),%edx
  1035b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1035b9:	89 50 04             	mov    %edx,0x4(%eax)
  return f;
  1035bc:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1035bf:	c9                   	leave
  1035c0:	c3                   	ret

001035c1 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
  1035c1:	55                   	push   %ebp
  1035c2:	89 e5                	mov    %esp,%ebp
  1035c4:	83 ec 28             	sub    $0x28,%esp
  struct file ff;

  if(f->ref < 1)
  1035c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1035ca:	8b 40 04             	mov    0x4(%eax),%eax
  1035cd:	85 c0                	test   %eax,%eax
  1035cf:	7f 0d                	jg     1035de <fileclose+0x1d>
    panic("fileclose");
  1035d1:	83 ec 0c             	sub    $0xc,%esp
  1035d4:	68 0b 45 10 00       	push   $0x10450b
  1035d9:	e8 cf cc ff ff       	call   1002ad <panic>
  if(--f->ref > 0){
  1035de:	8b 45 08             	mov    0x8(%ebp),%eax
  1035e1:	8b 40 04             	mov    0x4(%eax),%eax
  1035e4:	8d 50 ff             	lea    -0x1(%eax),%edx
  1035e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1035ea:	89 50 04             	mov    %edx,0x4(%eax)
  1035ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1035f0:	8b 40 04             	mov    0x4(%eax),%eax
  1035f3:	85 c0                	test   %eax,%eax
  1035f5:	7f 56                	jg     10364d <fileclose+0x8c>
    return;
  }
  ff = *f;
  1035f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1035fa:	8b 10                	mov    (%eax),%edx
  1035fc:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1035ff:	8b 50 04             	mov    0x4(%eax),%edx
  103602:	89 55 e8             	mov    %edx,-0x18(%ebp)
  103605:	8b 50 08             	mov    0x8(%eax),%edx
  103608:	89 55 ec             	mov    %edx,-0x14(%ebp)
  10360b:	8b 50 0c             	mov    0xc(%eax),%edx
  10360e:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103611:	8b 40 10             	mov    0x10(%eax),%eax
  103614:	89 45 f4             	mov    %eax,-0xc(%ebp)
  f->ref = 0;
  103617:	8b 45 08             	mov    0x8(%ebp),%eax
  10361a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  f->type = FD_NONE;
  103621:	8b 45 08             	mov    0x8(%ebp),%eax
  103624:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(ff.type == FD_INODE){
  10362a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10362d:	83 f8 01             	cmp    $0x1,%eax
  103630:	75 1c                	jne    10364e <fileclose+0x8d>
    begin_op();
  103632:	e8 bb 09 00 00       	call   103ff2 <begin_op>
    iput(ff.ip);
  103637:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10363a:	83 ec 0c             	sub    $0xc,%esp
  10363d:	50                   	push   %eax
  10363e:	e8 2b f4 ff ff       	call   102a6e <iput>
  103643:	83 c4 10             	add    $0x10,%esp
    end_op();
  103646:	e8 ad 09 00 00       	call   103ff8 <end_op>
  10364b:	eb 01                	jmp    10364e <fileclose+0x8d>
    return;
  10364d:	90                   	nop
  }
}
  10364e:	c9                   	leave
  10364f:	c3                   	ret

00103650 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
  103650:	55                   	push   %ebp
  103651:	89 e5                	mov    %esp,%ebp
  103653:	83 ec 08             	sub    $0x8,%esp
  if(f->type == FD_INODE){
  103656:	8b 45 08             	mov    0x8(%ebp),%eax
  103659:	8b 00                	mov    (%eax),%eax
  10365b:	83 f8 01             	cmp    $0x1,%eax
  10365e:	75 2e                	jne    10368e <filestat+0x3e>
    iread(f->ip);
  103660:	8b 45 08             	mov    0x8(%ebp),%eax
  103663:	8b 40 0c             	mov    0xc(%eax),%eax
  103666:	83 ec 0c             	sub    $0xc,%esp
  103669:	50                   	push   %eax
  10366a:	e8 db f5 ff ff       	call   102c4a <iread>
  10366f:	83 c4 10             	add    $0x10,%esp
    stati(f->ip, st);
  103672:	8b 45 08             	mov    0x8(%ebp),%eax
  103675:	8b 40 0c             	mov    0xc(%eax),%eax
  103678:	83 ec 08             	sub    $0x8,%esp
  10367b:	ff 75 0c             	push   0xc(%ebp)
  10367e:	50                   	push   %eax
  10367f:	e8 05 f9 ff ff       	call   102f89 <stati>
  103684:	83 c4 10             	add    $0x10,%esp
    return 0;
  103687:	b8 00 00 00 00       	mov    $0x0,%eax
  10368c:	eb 05                	jmp    103693 <filestat+0x43>
  }
  return -1;
  10368e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  103693:	c9                   	leave
  103694:	c3                   	ret

00103695 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
  103695:	55                   	push   %ebp
  103696:	89 e5                	mov    %esp,%ebp
  103698:	83 ec 18             	sub    $0x18,%esp
  int r;

  if(f->readable == 0)
  10369b:	8b 45 08             	mov    0x8(%ebp),%eax
  10369e:	0f b6 40 08          	movzbl 0x8(%eax),%eax
  1036a2:	84 c0                	test   %al,%al
  1036a4:	75 07                	jne    1036ad <fileread+0x18>
    return -1;
  1036a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1036ab:	eb 65                	jmp    103712 <fileread+0x7d>
  if(f->type == FD_INODE){
  1036ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1036b0:	8b 00                	mov    (%eax),%eax
  1036b2:	83 f8 01             	cmp    $0x1,%eax
  1036b5:	75 4e                	jne    103705 <fileread+0x70>
    iread(f->ip);
  1036b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1036ba:	8b 40 0c             	mov    0xc(%eax),%eax
  1036bd:	83 ec 0c             	sub    $0xc,%esp
  1036c0:	50                   	push   %eax
  1036c1:	e8 84 f5 ff ff       	call   102c4a <iread>
  1036c6:	83 c4 10             	add    $0x10,%esp
    if((r = readi(f->ip, addr, f->off, n)) > 0)
  1036c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1036cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1036cf:	8b 50 10             	mov    0x10(%eax),%edx
  1036d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1036d5:	8b 40 0c             	mov    0xc(%eax),%eax
  1036d8:	51                   	push   %ecx
  1036d9:	52                   	push   %edx
  1036da:	ff 75 0c             	push   0xc(%ebp)
  1036dd:	50                   	push   %eax
  1036de:	e8 ec f8 ff ff       	call   102fcf <readi>
  1036e3:	83 c4 10             	add    $0x10,%esp
  1036e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1036e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1036ed:	7e 11                	jle    103700 <fileread+0x6b>
      f->off += r;
  1036ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1036f2:	8b 50 10             	mov    0x10(%eax),%edx
  1036f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1036f8:	01 c2                	add    %eax,%edx
  1036fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1036fd:	89 50 10             	mov    %edx,0x10(%eax)
    return r;
  103700:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103703:	eb 0d                	jmp    103712 <fileread+0x7d>
  }
  panic("fileread");
  103705:	83 ec 0c             	sub    $0xc,%esp
  103708:	68 15 45 10 00       	push   $0x104515
  10370d:	e8 9b cb ff ff       	call   1002ad <panic>
}
  103712:	c9                   	leave
  103713:	c3                   	ret

00103714 <filewrite>:

// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
  103714:	55                   	push   %ebp
  103715:	89 e5                	mov    %esp,%ebp
  103717:	53                   	push   %ebx
  103718:	83 ec 14             	sub    $0x14,%esp
  int r;

  if(f->writable == 0)
  10371b:	8b 45 08             	mov    0x8(%ebp),%eax
  10371e:	0f b6 40 09          	movzbl 0x9(%eax),%eax
  103722:	84 c0                	test   %al,%al
  103724:	75 0a                	jne    103730 <filewrite+0x1c>
    return -1;
  103726:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10372b:	e9 e2 00 00 00       	jmp    103812 <filewrite+0xfe>
  if(f->type == FD_INODE){
  103730:	8b 45 08             	mov    0x8(%ebp),%eax
  103733:	8b 00                	mov    (%eax),%eax
  103735:	83 f8 01             	cmp    $0x1,%eax
  103738:	0f 85 c7 00 00 00    	jne    103805 <filewrite+0xf1>
    // write a few blocks at a time
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
  10373e:	c7 45 ec 00 06 00 00 	movl   $0x600,-0x14(%ebp)
    int i = 0;
  103745:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while(i < n){
  10374c:	e9 91 00 00 00       	jmp    1037e2 <filewrite+0xce>
      int n1 = n - i;
  103751:	8b 45 10             	mov    0x10(%ebp),%eax
  103754:	2b 45 f4             	sub    -0xc(%ebp),%eax
  103757:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(n1 > max)
  10375a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10375d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103760:	7e 06                	jle    103768 <filewrite+0x54>
        n1 = max;
  103762:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103765:	89 45 f0             	mov    %eax,-0x10(%ebp)

			begin_op();
  103768:	e8 85 08 00 00       	call   103ff2 <begin_op>
      iread(f->ip);
  10376d:	8b 45 08             	mov    0x8(%ebp),%eax
  103770:	8b 40 0c             	mov    0xc(%eax),%eax
  103773:	83 ec 0c             	sub    $0xc,%esp
  103776:	50                   	push   %eax
  103777:	e8 ce f4 ff ff       	call   102c4a <iread>
  10377c:	83 c4 10             	add    $0x10,%esp
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
  10377f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  103782:	8b 45 08             	mov    0x8(%ebp),%eax
  103785:	8b 50 10             	mov    0x10(%eax),%edx
  103788:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10378b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10378e:	01 c3                	add    %eax,%ebx
  103790:	8b 45 08             	mov    0x8(%ebp),%eax
  103793:	8b 40 0c             	mov    0xc(%eax),%eax
  103796:	51                   	push   %ecx
  103797:	52                   	push   %edx
  103798:	53                   	push   %ebx
  103799:	50                   	push   %eax
  10379a:	e8 28 f9 ff ff       	call   1030c7 <writei>
  10379f:	83 c4 10             	add    $0x10,%esp
  1037a2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1037a5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1037a9:	7e 11                	jle    1037bc <filewrite+0xa8>
        f->off += r;
  1037ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1037ae:	8b 50 10             	mov    0x10(%eax),%edx
  1037b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1037b4:	01 c2                	add    %eax,%edx
  1037b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1037b9:	89 50 10             	mov    %edx,0x10(%eax)
      end_op();
  1037bc:	e8 37 08 00 00       	call   103ff8 <end_op>

      if(r < 0)
  1037c1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1037c5:	78 29                	js     1037f0 <filewrite+0xdc>
        break;
      if(r != n1)
  1037c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1037ca:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  1037cd:	74 0d                	je     1037dc <filewrite+0xc8>
        panic("short filewrite");
  1037cf:	83 ec 0c             	sub    $0xc,%esp
  1037d2:	68 1e 45 10 00       	push   $0x10451e
  1037d7:	e8 d1 ca ff ff       	call   1002ad <panic>
      i += r;
  1037dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1037df:	01 45 f4             	add    %eax,-0xc(%ebp)
    while(i < n){
  1037e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1037e5:	3b 45 10             	cmp    0x10(%ebp),%eax
  1037e8:	0f 8c 63 ff ff ff    	jl     103751 <filewrite+0x3d>
  1037ee:	eb 01                	jmp    1037f1 <filewrite+0xdd>
        break;
  1037f0:	90                   	nop
    }
    return i == n ? n : -1;
  1037f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1037f4:	3b 45 10             	cmp    0x10(%ebp),%eax
  1037f7:	75 05                	jne    1037fe <filewrite+0xea>
  1037f9:	8b 45 10             	mov    0x10(%ebp),%eax
  1037fc:	eb 14                	jmp    103812 <filewrite+0xfe>
  1037fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103803:	eb 0d                	jmp    103812 <filewrite+0xfe>
  }
  panic("filewrite");
  103805:	83 ec 0c             	sub    $0xc,%esp
  103808:	68 2e 45 10 00       	push   $0x10452e
  10380d:	e8 9b ca ff ff       	call   1002ad <panic>
}
  103812:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103815:	c9                   	leave
  103816:	c3                   	ret

00103817 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
int
isdirempty(struct inode *dp)
{
  103817:	55                   	push   %ebp
  103818:	89 e5                	mov    %esp,%ebp
  10381a:	83 ec 28             	sub    $0x28,%esp
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
  10381d:	c7 45 f4 20 00 00 00 	movl   $0x20,-0xc(%ebp)
  103824:	eb 40                	jmp    103866 <isdirempty+0x4f>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103826:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103829:	6a 10                	push   $0x10
  10382b:	50                   	push   %eax
  10382c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  10382f:	50                   	push   %eax
  103830:	ff 75 08             	push   0x8(%ebp)
  103833:	e8 97 f7 ff ff       	call   102fcf <readi>
  103838:	83 c4 10             	add    $0x10,%esp
  10383b:	83 f8 10             	cmp    $0x10,%eax
  10383e:	74 0d                	je     10384d <isdirempty+0x36>
      panic("isdirempty: readi");
  103840:	83 ec 0c             	sub    $0xc,%esp
  103843:	68 38 45 10 00       	push   $0x104538
  103848:	e8 60 ca ff ff       	call   1002ad <panic>
    if(de.inum != 0)
  10384d:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  103851:	66 85 c0             	test   %ax,%ax
  103854:	74 07                	je     10385d <isdirempty+0x46>
      return 0;
  103856:	b8 00 00 00 00       	mov    $0x0,%eax
  10385b:	eb 1b                	jmp    103878 <isdirempty+0x61>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
  10385d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103860:	83 c0 10             	add    $0x10,%eax
  103863:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103866:	8b 45 08             	mov    0x8(%ebp),%eax
  103869:	8b 50 18             	mov    0x18(%eax),%edx
  10386c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10386f:	39 c2                	cmp    %eax,%edx
  103871:	77 b3                	ja     103826 <isdirempty+0xf>
  }
  return 1;
  103873:	b8 01 00 00 00       	mov    $0x1,%eax
}
  103878:	c9                   	leave
  103879:	c3                   	ret

0010387a <unlink>:

int
unlink(char* path, char* name)
{
  10387a:	55                   	push   %ebp
  10387b:	89 e5                	mov    %esp,%ebp
  10387d:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip, *dp;
  struct dirent de;
  uint off;

	begin_op();
  103880:	e8 6d 07 00 00       	call   103ff2 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
  103885:	83 ec 08             	sub    $0x8,%esp
  103888:	ff 75 0c             	push   0xc(%ebp)
  10388b:	ff 75 08             	push   0x8(%ebp)
  10388e:	e8 a5 fc ff ff       	call   103538 <nameiparent>
  103893:	83 c4 10             	add    $0x10,%esp
  103896:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103899:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10389d:	75 0f                	jne    1038ae <unlink+0x34>
    end_op();
  10389f:	e8 54 07 00 00       	call   103ff8 <end_op>
    return -1;
  1038a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1038a9:	e9 8c 01 00 00       	jmp    103a3a <unlink+0x1c0>
  }

  iread(dp);
  1038ae:	83 ec 0c             	sub    $0xc,%esp
  1038b1:	ff 75 f4             	push   -0xc(%ebp)
  1038b4:	e8 91 f3 ff ff       	call   102c4a <iread>
  1038b9:	83 c4 10             	add    $0x10,%esp

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
  1038bc:	83 ec 08             	sub    $0x8,%esp
  1038bf:	68 4a 45 10 00       	push   $0x10454a
  1038c4:	ff 75 0c             	push   0xc(%ebp)
  1038c7:	e8 18 f9 ff ff       	call   1031e4 <namecmp>
  1038cc:	83 c4 10             	add    $0x10,%esp
  1038cf:	85 c0                	test   %eax,%eax
  1038d1:	0f 84 47 01 00 00    	je     103a1e <unlink+0x1a4>
  1038d7:	83 ec 08             	sub    $0x8,%esp
  1038da:	68 4c 45 10 00       	push   $0x10454c
  1038df:	ff 75 0c             	push   0xc(%ebp)
  1038e2:	e8 fd f8 ff ff       	call   1031e4 <namecmp>
  1038e7:	83 c4 10             	add    $0x10,%esp
  1038ea:	85 c0                	test   %eax,%eax
  1038ec:	0f 84 2c 01 00 00    	je     103a1e <unlink+0x1a4>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
  1038f2:	83 ec 04             	sub    $0x4,%esp
  1038f5:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1038f8:	50                   	push   %eax
  1038f9:	ff 75 0c             	push   0xc(%ebp)
  1038fc:	ff 75 f4             	push   -0xc(%ebp)
  1038ff:	e8 fb f8 ff ff       	call   1031ff <dirlookup>
  103904:	83 c4 10             	add    $0x10,%esp
  103907:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10390a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10390e:	0f 84 0d 01 00 00    	je     103a21 <unlink+0x1a7>
    goto bad;
  iread(ip);
  103914:	83 ec 0c             	sub    $0xc,%esp
  103917:	ff 75 f0             	push   -0x10(%ebp)
  10391a:	e8 2b f3 ff ff       	call   102c4a <iread>
  10391f:	83 c4 10             	add    $0x10,%esp

  if(ip->nlink < 1)
  103922:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103925:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103929:	66 85 c0             	test   %ax,%ax
  10392c:	7f 0d                	jg     10393b <unlink+0xc1>
    panic("unlink: nlink < 1");
  10392e:	83 ec 0c             	sub    $0xc,%esp
  103931:	68 4f 45 10 00       	push   $0x10454f
  103936:	e8 72 c9 ff ff       	call   1002ad <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
  10393b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10393e:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103942:	66 83 f8 01          	cmp    $0x1,%ax
  103946:	75 25                	jne    10396d <unlink+0xf3>
  103948:	83 ec 0c             	sub    $0xc,%esp
  10394b:	ff 75 f0             	push   -0x10(%ebp)
  10394e:	e8 c4 fe ff ff       	call   103817 <isdirempty>
  103953:	83 c4 10             	add    $0x10,%esp
  103956:	85 c0                	test   %eax,%eax
  103958:	75 13                	jne    10396d <unlink+0xf3>
    iput(ip);
  10395a:	83 ec 0c             	sub    $0xc,%esp
  10395d:	ff 75 f0             	push   -0x10(%ebp)
  103960:	e8 09 f1 ff ff       	call   102a6e <iput>
  103965:	83 c4 10             	add    $0x10,%esp
    goto bad;
  103968:	e9 b5 00 00 00       	jmp    103a22 <unlink+0x1a8>
  }

  memset(&de, 0, sizeof(de));
  10396d:	83 ec 04             	sub    $0x4,%esp
  103970:	6a 10                	push   $0x10
  103972:	6a 00                	push   $0x0
  103974:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103977:	50                   	push   %eax
  103978:	e8 2a d5 ff ff       	call   100ea7 <memset>
  10397d:	83 c4 10             	add    $0x10,%esp
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103980:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103983:	6a 10                	push   $0x10
  103985:	50                   	push   %eax
  103986:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103989:	50                   	push   %eax
  10398a:	ff 75 f4             	push   -0xc(%ebp)
  10398d:	e8 35 f7 ff ff       	call   1030c7 <writei>
  103992:	83 c4 10             	add    $0x10,%esp
  103995:	83 f8 10             	cmp    $0x10,%eax
  103998:	74 0d                	je     1039a7 <unlink+0x12d>
    panic("unlink: writei");
  10399a:	83 ec 0c             	sub    $0xc,%esp
  10399d:	68 61 45 10 00       	push   $0x104561
  1039a2:	e8 06 c9 ff ff       	call   1002ad <panic>
  if(ip->type == T_DIR){
  1039a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1039aa:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  1039ae:	66 83 f8 01          	cmp    $0x1,%ax
  1039b2:	75 21                	jne    1039d5 <unlink+0x15b>
    dp->nlink--;
  1039b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1039b7:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  1039bb:	83 e8 01             	sub    $0x1,%eax
  1039be:	89 c2                	mov    %eax,%edx
  1039c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1039c3:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
  1039c7:	83 ec 0c             	sub    $0xc,%esp
  1039ca:	ff 75 f4             	push   -0xc(%ebp)
  1039cd:	e8 08 f1 ff ff       	call   102ada <iupdate>
  1039d2:	83 c4 10             	add    $0x10,%esp
  }
  iput(dp);
  1039d5:	83 ec 0c             	sub    $0xc,%esp
  1039d8:	ff 75 f4             	push   -0xc(%ebp)
  1039db:	e8 8e f0 ff ff       	call   102a6e <iput>
  1039e0:	83 c4 10             	add    $0x10,%esp

  ip->nlink--;
  1039e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1039e6:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  1039ea:	83 e8 01             	sub    $0x1,%eax
  1039ed:	89 c2                	mov    %eax,%edx
  1039ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1039f2:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
  1039f6:	83 ec 0c             	sub    $0xc,%esp
  1039f9:	ff 75 f0             	push   -0x10(%ebp)
  1039fc:	e8 d9 f0 ff ff       	call   102ada <iupdate>
  103a01:	83 c4 10             	add    $0x10,%esp
  iput(ip);
  103a04:	83 ec 0c             	sub    $0xc,%esp
  103a07:	ff 75 f0             	push   -0x10(%ebp)
  103a0a:	e8 5f f0 ff ff       	call   102a6e <iput>
  103a0f:	83 c4 10             	add    $0x10,%esp

  end_op();
  103a12:	e8 e1 05 00 00       	call   103ff8 <end_op>
  return 0;
  103a17:	b8 00 00 00 00       	mov    $0x0,%eax
  103a1c:	eb 1c                	jmp    103a3a <unlink+0x1c0>
    goto bad;
  103a1e:	90                   	nop
  103a1f:	eb 01                	jmp    103a22 <unlink+0x1a8>
    goto bad;
  103a21:	90                   	nop

bad:
  iput(dp);
  103a22:	83 ec 0c             	sub    $0xc,%esp
  103a25:	ff 75 f4             	push   -0xc(%ebp)
  103a28:	e8 41 f0 ff ff       	call   102a6e <iput>
  103a2d:	83 c4 10             	add    $0x10,%esp
  end_op();
  103a30:	e8 c3 05 00 00       	call   103ff8 <end_op>
  return -1;
  103a35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  103a3a:	c9                   	leave
  103a3b:	c3                   	ret

00103a3c <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
  103a3c:	55                   	push   %ebp
  103a3d:	89 e5                	mov    %esp,%ebp
  103a3f:	83 ec 38             	sub    $0x38,%esp
  103a42:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  103a45:	8b 55 10             	mov    0x10(%ebp),%edx
  103a48:	8b 45 14             	mov    0x14(%ebp),%eax
  103a4b:	66 89 4d d4          	mov    %cx,-0x2c(%ebp)
  103a4f:	66 89 55 d0          	mov    %dx,-0x30(%ebp)
  103a53:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
  103a57:	83 ec 08             	sub    $0x8,%esp
  103a5a:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  103a5d:	50                   	push   %eax
  103a5e:	ff 75 08             	push   0x8(%ebp)
  103a61:	e8 d2 fa ff ff       	call   103538 <nameiparent>
  103a66:	83 c4 10             	add    $0x10,%esp
  103a69:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103a6c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103a70:	75 0a                	jne    103a7c <create+0x40>
    return 0;
  103a72:	b8 00 00 00 00       	mov    $0x0,%eax
  103a77:	e9 8e 01 00 00       	jmp    103c0a <create+0x1ce>
  iread(dp);
  103a7c:	83 ec 0c             	sub    $0xc,%esp
  103a7f:	ff 75 f4             	push   -0xc(%ebp)
  103a82:	e8 c3 f1 ff ff       	call   102c4a <iread>
  103a87:	83 c4 10             	add    $0x10,%esp

  if((ip = dirlookup(dp, name, 0)) != 0){
  103a8a:	83 ec 04             	sub    $0x4,%esp
  103a8d:	6a 00                	push   $0x0
  103a8f:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  103a92:	50                   	push   %eax
  103a93:	ff 75 f4             	push   -0xc(%ebp)
  103a96:	e8 64 f7 ff ff       	call   1031ff <dirlookup>
  103a9b:	83 c4 10             	add    $0x10,%esp
  103a9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103aa1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103aa5:	74 50                	je     103af7 <create+0xbb>
    iput(dp);
  103aa7:	83 ec 0c             	sub    $0xc,%esp
  103aaa:	ff 75 f4             	push   -0xc(%ebp)
  103aad:	e8 bc ef ff ff       	call   102a6e <iput>
  103ab2:	83 c4 10             	add    $0x10,%esp
    iread(ip);
  103ab5:	83 ec 0c             	sub    $0xc,%esp
  103ab8:	ff 75 f0             	push   -0x10(%ebp)
  103abb:	e8 8a f1 ff ff       	call   102c4a <iread>
  103ac0:	83 c4 10             	add    $0x10,%esp
    if(type == T_FILE && ip->type == T_FILE)
  103ac3:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
  103ac8:	75 15                	jne    103adf <create+0xa3>
  103aca:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103acd:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103ad1:	66 83 f8 02          	cmp    $0x2,%ax
  103ad5:	75 08                	jne    103adf <create+0xa3>
      return ip;
  103ad7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ada:	e9 2b 01 00 00       	jmp    103c0a <create+0x1ce>
    iput(ip);
  103adf:	83 ec 0c             	sub    $0xc,%esp
  103ae2:	ff 75 f0             	push   -0x10(%ebp)
  103ae5:	e8 84 ef ff ff       	call   102a6e <iput>
  103aea:	83 c4 10             	add    $0x10,%esp
    return 0;
  103aed:	b8 00 00 00 00       	mov    $0x0,%eax
  103af2:	e9 13 01 00 00       	jmp    103c0a <create+0x1ce>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
  103af7:	0f bf 55 d4          	movswl -0x2c(%ebp),%edx
  103afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103afe:	8b 00                	mov    (%eax),%eax
  103b00:	83 ec 08             	sub    $0x8,%esp
  103b03:	52                   	push   %edx
  103b04:	50                   	push   %eax
  103b05:	e8 8d ee ff ff       	call   102997 <ialloc>
  103b0a:	83 c4 10             	add    $0x10,%esp
  103b0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103b10:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103b14:	75 0d                	jne    103b23 <create+0xe7>
    panic("create: ialloc");
  103b16:	83 ec 0c             	sub    $0xc,%esp
  103b19:	68 70 45 10 00       	push   $0x104570
  103b1e:	e8 8a c7 ff ff       	call   1002ad <panic>

  iread(ip);
  103b23:	83 ec 0c             	sub    $0xc,%esp
  103b26:	ff 75 f0             	push   -0x10(%ebp)
  103b29:	e8 1c f1 ff ff       	call   102c4a <iread>
  103b2e:	83 c4 10             	add    $0x10,%esp
  ip->major = major;
  103b31:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103b34:	0f b7 55 d0          	movzwl -0x30(%ebp),%edx
  103b38:	66 89 50 12          	mov    %dx,0x12(%eax)
  ip->minor = minor;
  103b3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103b3f:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
  103b43:	66 89 50 14          	mov    %dx,0x14(%eax)
  ip->nlink = 1;
  103b47:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103b4a:	66 c7 40 16 01 00    	movw   $0x1,0x16(%eax)
  iupdate(ip);
  103b50:	83 ec 0c             	sub    $0xc,%esp
  103b53:	ff 75 f0             	push   -0x10(%ebp)
  103b56:	e8 7f ef ff ff       	call   102ada <iupdate>
  103b5b:	83 c4 10             	add    $0x10,%esp

  if(type == T_DIR){  // Create . and .. entries.
  103b5e:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
  103b63:	75 6a                	jne    103bcf <create+0x193>
    dp->nlink++;  // for ".."
  103b65:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103b68:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103b6c:	83 c0 01             	add    $0x1,%eax
  103b6f:	89 c2                	mov    %eax,%edx
  103b71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103b74:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
  103b78:	83 ec 0c             	sub    $0xc,%esp
  103b7b:	ff 75 f4             	push   -0xc(%ebp)
  103b7e:	e8 57 ef ff ff       	call   102ada <iupdate>
  103b83:	83 c4 10             	add    $0x10,%esp
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
  103b86:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103b89:	8b 40 04             	mov    0x4(%eax),%eax
  103b8c:	83 ec 04             	sub    $0x4,%esp
  103b8f:	50                   	push   %eax
  103b90:	68 4a 45 10 00       	push   $0x10454a
  103b95:	ff 75 f0             	push   -0x10(%ebp)
  103b98:	e8 1c f7 ff ff       	call   1032b9 <dirlink>
  103b9d:	83 c4 10             	add    $0x10,%esp
  103ba0:	85 c0                	test   %eax,%eax
  103ba2:	78 1e                	js     103bc2 <create+0x186>
  103ba4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ba7:	8b 40 04             	mov    0x4(%eax),%eax
  103baa:	83 ec 04             	sub    $0x4,%esp
  103bad:	50                   	push   %eax
  103bae:	68 4c 45 10 00       	push   $0x10454c
  103bb3:	ff 75 f0             	push   -0x10(%ebp)
  103bb6:	e8 fe f6 ff ff       	call   1032b9 <dirlink>
  103bbb:	83 c4 10             	add    $0x10,%esp
  103bbe:	85 c0                	test   %eax,%eax
  103bc0:	79 0d                	jns    103bcf <create+0x193>
      panic("create dots");
  103bc2:	83 ec 0c             	sub    $0xc,%esp
  103bc5:	68 7f 45 10 00       	push   $0x10457f
  103bca:	e8 de c6 ff ff       	call   1002ad <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
  103bcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103bd2:	8b 40 04             	mov    0x4(%eax),%eax
  103bd5:	83 ec 04             	sub    $0x4,%esp
  103bd8:	50                   	push   %eax
  103bd9:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  103bdc:	50                   	push   %eax
  103bdd:	ff 75 f4             	push   -0xc(%ebp)
  103be0:	e8 d4 f6 ff ff       	call   1032b9 <dirlink>
  103be5:	83 c4 10             	add    $0x10,%esp
  103be8:	85 c0                	test   %eax,%eax
  103bea:	79 0d                	jns    103bf9 <create+0x1bd>
    panic("create: dirlink");
  103bec:	83 ec 0c             	sub    $0xc,%esp
  103bef:	68 8b 45 10 00       	push   $0x10458b
  103bf4:	e8 b4 c6 ff ff       	call   1002ad <panic>

  iput(dp);
  103bf9:	83 ec 0c             	sub    $0xc,%esp
  103bfc:	ff 75 f4             	push   -0xc(%ebp)
  103bff:	e8 6a ee ff ff       	call   102a6e <iput>
  103c04:	83 c4 10             	add    $0x10,%esp

  return ip;
  103c07:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  103c0a:	c9                   	leave
  103c0b:	c3                   	ret

00103c0c <open>:


struct file*
open(char* path, int omode)
{
  103c0c:	55                   	push   %ebp
  103c0d:	89 e5                	mov    %esp,%ebp
  103c0f:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;

  begin_op();
  103c12:	e8 db 03 00 00       	call   103ff2 <begin_op>

  if(omode & O_CREATE){
  103c17:	8b 45 0c             	mov    0xc(%ebp),%eax
  103c1a:	25 00 02 00 00       	and    $0x200,%eax
  103c1f:	85 c0                	test   %eax,%eax
  103c21:	74 29                	je     103c4c <open+0x40>
    ip = create(path, T_FILE, 0, 0);
  103c23:	6a 00                	push   $0x0
  103c25:	6a 00                	push   $0x0
  103c27:	6a 02                	push   $0x2
  103c29:	ff 75 08             	push   0x8(%ebp)
  103c2c:	e8 0b fe ff ff       	call   103a3c <create>
  103c31:	83 c4 10             	add    $0x10,%esp
  103c34:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ip == 0){
  103c37:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103c3b:	75 73                	jne    103cb0 <open+0xa4>
      end_op();
  103c3d:	e8 b6 03 00 00       	call   103ff8 <end_op>
      return 0;
  103c42:	b8 00 00 00 00       	mov    $0x0,%eax
  103c47:	e9 eb 00 00 00       	jmp    103d37 <open+0x12b>
    }
  } else {
    if((ip = namei(path)) == 0){
  103c4c:	83 ec 0c             	sub    $0xc,%esp
  103c4f:	ff 75 08             	push   0x8(%ebp)
  103c52:	e8 c5 f8 ff ff       	call   10351c <namei>
  103c57:	83 c4 10             	add    $0x10,%esp
  103c5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103c5d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103c61:	75 0f                	jne    103c72 <open+0x66>
      end_op();
  103c63:	e8 90 03 00 00       	call   103ff8 <end_op>
      return 0;
  103c68:	b8 00 00 00 00       	mov    $0x0,%eax
  103c6d:	e9 c5 00 00 00       	jmp    103d37 <open+0x12b>
    }
    iread(ip);
  103c72:	83 ec 0c             	sub    $0xc,%esp
  103c75:	ff 75 f4             	push   -0xc(%ebp)
  103c78:	e8 cd ef ff ff       	call   102c4a <iread>
  103c7d:	83 c4 10             	add    $0x10,%esp
    if(ip->type == T_DIR && omode != O_RDONLY){
  103c80:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103c83:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103c87:	66 83 f8 01          	cmp    $0x1,%ax
  103c8b:	75 23                	jne    103cb0 <open+0xa4>
  103c8d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103c91:	74 1d                	je     103cb0 <open+0xa4>
      iput(ip);
  103c93:	83 ec 0c             	sub    $0xc,%esp
  103c96:	ff 75 f4             	push   -0xc(%ebp)
  103c99:	e8 d0 ed ff ff       	call   102a6e <iput>
  103c9e:	83 c4 10             	add    $0x10,%esp
      end_op();
  103ca1:	e8 52 03 00 00       	call   103ff8 <end_op>
      return 0;
  103ca6:	b8 00 00 00 00       	mov    $0x0,%eax
  103cab:	e9 87 00 00 00       	jmp    103d37 <open+0x12b>
    }
  }

  struct file* f;
  if((f = filealloc()) == 0) { 
  103cb0:	e8 9e f8 ff ff       	call   103553 <filealloc>
  103cb5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103cb8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103cbc:	75 1a                	jne    103cd8 <open+0xcc>
    iput(ip);
  103cbe:	83 ec 0c             	sub    $0xc,%esp
  103cc1:	ff 75 f4             	push   -0xc(%ebp)
  103cc4:	e8 a5 ed ff ff       	call   102a6e <iput>
  103cc9:	83 c4 10             	add    $0x10,%esp
    end_op();
  103ccc:	e8 27 03 00 00       	call   103ff8 <end_op>
    return 0;
  103cd1:	b8 00 00 00 00       	mov    $0x0,%eax
  103cd6:	eb 5f                	jmp    103d37 <open+0x12b>
  }

  f->type = FD_INODE;
  103cd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103cdb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  f->ip = ip;
  103ce1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ce4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103ce7:	89 50 0c             	mov    %edx,0xc(%eax)
  f->off = 0;
  103cea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ced:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  f->readable = !(omode & O_WRONLY);
  103cf4:	8b 45 0c             	mov    0xc(%ebp),%eax
  103cf7:	83 e0 01             	and    $0x1,%eax
  103cfa:	85 c0                	test   %eax,%eax
  103cfc:	0f 94 c0             	sete   %al
  103cff:	89 c2                	mov    %eax,%edx
  103d01:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103d04:	88 50 08             	mov    %dl,0x8(%eax)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  103d07:	8b 45 0c             	mov    0xc(%ebp),%eax
  103d0a:	83 e0 01             	and    $0x1,%eax
  103d0d:	85 c0                	test   %eax,%eax
  103d0f:	75 0a                	jne    103d1b <open+0x10f>
  103d11:	8b 45 0c             	mov    0xc(%ebp),%eax
  103d14:	83 e0 02             	and    $0x2,%eax
  103d17:	85 c0                	test   %eax,%eax
  103d19:	74 07                	je     103d22 <open+0x116>
  103d1b:	b8 01 00 00 00       	mov    $0x1,%eax
  103d20:	eb 05                	jmp    103d27 <open+0x11b>
  103d22:	b8 00 00 00 00       	mov    $0x0,%eax
  103d27:	89 c2                	mov    %eax,%edx
  103d29:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103d2c:	88 50 09             	mov    %dl,0x9(%eax)
  end_op();
  103d2f:	e8 c4 02 00 00       	call   103ff8 <end_op>
  return f;
  103d34:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  103d37:	c9                   	leave
  103d38:	c3                   	ret

00103d39 <mkdir>:

int mkdir(char *path)
{
  103d39:	55                   	push   %ebp
  103d3a:	89 e5                	mov    %esp,%ebp
  103d3c:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;

  begin_op();
  103d3f:	e8 ae 02 00 00       	call   103ff2 <begin_op>
  if((ip = create(path, T_DIR, 0, 0)) == 0){
  103d44:	6a 00                	push   $0x0
  103d46:	6a 00                	push   $0x0
  103d48:	6a 01                	push   $0x1
  103d4a:	ff 75 08             	push   0x8(%ebp)
  103d4d:	e8 ea fc ff ff       	call   103a3c <create>
  103d52:	83 c4 10             	add    $0x10,%esp
  103d55:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103d58:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103d5c:	75 0c                	jne    103d6a <mkdir+0x31>
    end_op();
  103d5e:	e8 95 02 00 00       	call   103ff8 <end_op>
    return -1;
  103d63:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103d68:	eb 18                	jmp    103d82 <mkdir+0x49>
  }
  iput(ip);
  103d6a:	83 ec 0c             	sub    $0xc,%esp
  103d6d:	ff 75 f4             	push   -0xc(%ebp)
  103d70:	e8 f9 ec ff ff       	call   102a6e <iput>
  103d75:	83 c4 10             	add    $0x10,%esp
  end_op();
  103d78:	e8 7b 02 00 00       	call   103ff8 <end_op>
  return 0;
  103d7d:	b8 00 00 00 00       	mov    $0x0,%eax
  103d82:	c9                   	leave
  103d83:	c3                   	ret

00103d84 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
  103d84:	55                   	push   %ebp
  103d85:	89 e5                	mov    %esp,%ebp
  103d87:	83 ec 28             	sub    $0x28,%esp
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  readsb(dev, &sb);
  103d8a:	83 ec 08             	sub    $0x8,%esp
  103d8d:	8d 45 dc             	lea    -0x24(%ebp),%eax
  103d90:	50                   	push   %eax
  103d91:	ff 75 08             	push   0x8(%ebp)
  103d94:	e8 01 e9 ff ff       	call   10269a <readsb>
  103d99:	83 c4 10             	add    $0x10,%esp
  log.start = sb.logstart;
  103d9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103d9f:	a3 a0 f7 10 00       	mov    %eax,0x10f7a0
  log.size = sb.nlog;
  103da4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103da7:	a3 a4 f7 10 00       	mov    %eax,0x10f7a4
  log.dev = dev;
  103dac:	8b 45 08             	mov    0x8(%ebp),%eax
  103daf:	a3 ac f7 10 00       	mov    %eax,0x10f7ac
  log.reboot = 1;
  103db4:	c7 05 b0 f7 10 00 01 	movl   $0x1,0x10f7b0
  103dbb:	00 00 00 
  recover_from_log();
  103dbe:	e8 0d 02 00 00       	call   103fd0 <recover_from_log>
  log.reboot = 0;
  103dc3:	c7 05 b0 f7 10 00 00 	movl   $0x0,0x10f7b0
  103dca:	00 00 00 
}
  103dcd:	90                   	nop
  103dce:	c9                   	leave
  103dcf:	c3                   	ret

00103dd0 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
  103dd0:	55                   	push   %ebp
  103dd1:	89 e5                	mov    %esp,%ebp
  103dd3:	83 ec 18             	sub    $0x18,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
  103dd6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103ddd:	e9 e5 00 00 00       	jmp    103ec7 <install_trans+0xf7>
    if (LOG_FLAG == 5) {
      if (tail == log.lh.n/2) panic("[UNDOLOG] Panic in install_trans type 5");
    }
    if (log.reboot == 1){
  103de2:	a1 b0 f7 10 00       	mov    0x10f7b0,%eax
  103de7:	83 f8 01             	cmp    $0x1,%eax
  103dea:	0f 85 93 00 00 00    	jne    103e83 <install_trans+0xb3>
      struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
  103df0:	8b 15 a0 f7 10 00    	mov    0x10f7a0,%edx
  103df6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103df9:	01 d0                	add    %edx,%eax
  103dfb:	83 c0 01             	add    $0x1,%eax
  103dfe:	89 c2                	mov    %eax,%edx
  103e00:	a1 ac f7 10 00       	mov    0x10f7ac,%eax
  103e05:	83 ec 08             	sub    $0x8,%esp
  103e08:	52                   	push   %edx
  103e09:	50                   	push   %eax
  103e0a:	e8 a2 e2 ff ff       	call   1020b1 <bread>
  103e0f:	83 c4 10             	add    $0x10,%esp
  103e12:	89 45 ec             	mov    %eax,-0x14(%ebp)
      struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
  103e15:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e18:	83 c0 04             	add    $0x4,%eax
  103e1b:	8b 04 85 a8 f7 10 00 	mov    0x10f7a8(,%eax,4),%eax
  103e22:	89 c2                	mov    %eax,%edx
  103e24:	a1 ac f7 10 00       	mov    0x10f7ac,%eax
  103e29:	83 ec 08             	sub    $0x8,%esp
  103e2c:	52                   	push   %edx
  103e2d:	50                   	push   %eax
  103e2e:	e8 7e e2 ff ff       	call   1020b1 <bread>
  103e33:	83 c4 10             	add    $0x10,%esp
  103e36:	89 45 e8             	mov    %eax,-0x18(%ebp)
      memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
  103e39:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103e3c:	8d 50 1c             	lea    0x1c(%eax),%edx
  103e3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103e42:	83 c0 1c             	add    $0x1c,%eax
  103e45:	83 ec 04             	sub    $0x4,%esp
  103e48:	68 00 02 00 00       	push   $0x200
  103e4d:	52                   	push   %edx
  103e4e:	50                   	push   %eax
  103e4f:	e8 12 d1 ff ff       	call   100f66 <memmove>
  103e54:	83 c4 10             	add    $0x10,%esp
      bwrite(dbuf);  // write dst to disk
  103e57:	83 ec 0c             	sub    $0xc,%esp
  103e5a:	ff 75 e8             	push   -0x18(%ebp)
  103e5d:	e8 88 e2 ff ff       	call   1020ea <bwrite>
  103e62:	83 c4 10             	add    $0x10,%esp
      brelse(lbuf);
  103e65:	83 ec 0c             	sub    $0xc,%esp
  103e68:	ff 75 ec             	push   -0x14(%ebp)
  103e6b:	e8 a2 e3 ff ff       	call   102212 <brelse>
  103e70:	83 c4 10             	add    $0x10,%esp
      brelse(dbuf);
  103e73:	83 ec 0c             	sub    $0xc,%esp
  103e76:	ff 75 e8             	push   -0x18(%ebp)
  103e79:	e8 94 e3 ff ff       	call   102212 <brelse>
  103e7e:	83 c4 10             	add    $0x10,%esp
  103e81:	eb 40                	jmp    103ec3 <install_trans+0xf3>
    }
    else{
      struct buf *dbuf = bread(log.dev, log.lh.block[tail]);
  103e83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e86:	83 c0 04             	add    $0x4,%eax
  103e89:	8b 04 85 a8 f7 10 00 	mov    0x10f7a8(,%eax,4),%eax
  103e90:	89 c2                	mov    %eax,%edx
  103e92:	a1 ac f7 10 00       	mov    0x10f7ac,%eax
  103e97:	83 ec 08             	sub    $0x8,%esp
  103e9a:	52                   	push   %edx
  103e9b:	50                   	push   %eax
  103e9c:	e8 10 e2 ff ff       	call   1020b1 <bread>
  103ea1:	83 c4 10             	add    $0x10,%esp
  103ea4:	89 45 f0             	mov    %eax,-0x10(%ebp)
      bwrite(dbuf);
  103ea7:	83 ec 0c             	sub    $0xc,%esp
  103eaa:	ff 75 f0             	push   -0x10(%ebp)
  103ead:	e8 38 e2 ff ff       	call   1020ea <bwrite>
  103eb2:	83 c4 10             	add    $0x10,%esp
      brelse(dbuf);
  103eb5:	83 ec 0c             	sub    $0xc,%esp
  103eb8:	ff 75 f0             	push   -0x10(%ebp)
  103ebb:	e8 52 e3 ff ff       	call   102212 <brelse>
  103ec0:	83 c4 10             	add    $0x10,%esp
  for (tail = 0; tail < log.lh.n; tail++) {
  103ec3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103ec7:	a1 b4 f7 10 00       	mov    0x10f7b4,%eax
  103ecc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103ecf:	0f 8c 0d ff ff ff    	jl     103de2 <install_trans+0x12>
    }
  }
}
  103ed5:	90                   	nop
  103ed6:	90                   	nop
  103ed7:	c9                   	leave
  103ed8:	c3                   	ret

00103ed9 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  103ed9:	55                   	push   %ebp
  103eda:	89 e5                	mov    %esp,%ebp
  103edc:	83 ec 18             	sub    $0x18,%esp
  struct buf *buf = bread(log.dev, log.start);
  103edf:	a1 a0 f7 10 00       	mov    0x10f7a0,%eax
  103ee4:	89 c2                	mov    %eax,%edx
  103ee6:	a1 ac f7 10 00       	mov    0x10f7ac,%eax
  103eeb:	83 ec 08             	sub    $0x8,%esp
  103eee:	52                   	push   %edx
  103eef:	50                   	push   %eax
  103ef0:	e8 bc e1 ff ff       	call   1020b1 <bread>
  103ef5:	83 c4 10             	add    $0x10,%esp
  103ef8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct logheader *lh = (struct logheader *) (buf->data);
  103efb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103efe:	83 c0 1c             	add    $0x1c,%eax
  103f01:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int i;
  log.lh.n = lh->n;
  103f04:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103f07:	8b 00                	mov    (%eax),%eax
  103f09:	a3 b4 f7 10 00       	mov    %eax,0x10f7b4
  for (i = 0; i < log.lh.n; i++) {
  103f0e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103f15:	eb 1b                	jmp    103f32 <read_head+0x59>
    log.lh.block[i] = lh->block[i];
  103f17:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103f1a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103f1d:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  103f21:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103f24:	83 c2 04             	add    $0x4,%edx
  103f27:	89 04 95 a8 f7 10 00 	mov    %eax,0x10f7a8(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
  103f2e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103f32:	a1 b4 f7 10 00       	mov    0x10f7b4,%eax
  103f37:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103f3a:	7c db                	jl     103f17 <read_head+0x3e>
  }
  brelse(buf);
  103f3c:	83 ec 0c             	sub    $0xc,%esp
  103f3f:	ff 75 f0             	push   -0x10(%ebp)
  103f42:	e8 cb e2 ff ff       	call   102212 <brelse>
  103f47:	83 c4 10             	add    $0x10,%esp
}
  103f4a:	90                   	nop
  103f4b:	c9                   	leave
  103f4c:	c3                   	ret

00103f4d <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  103f4d:	55                   	push   %ebp
  103f4e:	89 e5                	mov    %esp,%ebp
  103f50:	83 ec 18             	sub    $0x18,%esp
  struct buf *buf = bread(log.dev, log.start);
  103f53:	a1 a0 f7 10 00       	mov    0x10f7a0,%eax
  103f58:	89 c2                	mov    %eax,%edx
  103f5a:	a1 ac f7 10 00       	mov    0x10f7ac,%eax
  103f5f:	83 ec 08             	sub    $0x8,%esp
  103f62:	52                   	push   %edx
  103f63:	50                   	push   %eax
  103f64:	e8 48 e1 ff ff       	call   1020b1 <bread>
  103f69:	83 c4 10             	add    $0x10,%esp
  103f6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct logheader *hb = (struct logheader *) (buf->data);
  103f6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103f72:	83 c0 1c             	add    $0x1c,%eax
  103f75:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int i;
  hb->n = log.lh.n;
  103f78:	8b 15 b4 f7 10 00    	mov    0x10f7b4,%edx
  103f7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103f81:	89 10                	mov    %edx,(%eax)
  for (i = 0; i < log.lh.n; i++) {
  103f83:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103f8a:	eb 1b                	jmp    103fa7 <write_head+0x5a>
    hb->block[i] = log.lh.block[i];
  103f8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f8f:	83 c0 04             	add    $0x4,%eax
  103f92:	8b 0c 85 a8 f7 10 00 	mov    0x10f7a8(,%eax,4),%ecx
  103f99:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103f9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103f9f:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
  103fa3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103fa7:	a1 b4 f7 10 00       	mov    0x10f7b4,%eax
  103fac:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103faf:	7c db                	jl     103f8c <write_head+0x3f>
  }
  bwrite(buf);
  103fb1:	83 ec 0c             	sub    $0xc,%esp
  103fb4:	ff 75 f0             	push   -0x10(%ebp)
  103fb7:	e8 2e e1 ff ff       	call   1020ea <bwrite>
  103fbc:	83 c4 10             	add    $0x10,%esp
  brelse(buf);
  103fbf:	83 ec 0c             	sub    $0xc,%esp
  103fc2:	ff 75 f0             	push   -0x10(%ebp)
  103fc5:	e8 48 e2 ff ff       	call   102212 <brelse>
  103fca:	83 c4 10             	add    $0x10,%esp
}
  103fcd:	90                   	nop
  103fce:	c9                   	leave
  103fcf:	c3                   	ret

00103fd0 <recover_from_log>:

static void
recover_from_log(void)
{
  103fd0:	55                   	push   %ebp
  103fd1:	89 e5                	mov    %esp,%ebp
  103fd3:	83 ec 08             	sub    $0x8,%esp
  read_head();
  103fd6:	e8 fe fe ff ff       	call   103ed9 <read_head>
  install_trans(); // if committed, copy from log to disk
  103fdb:	e8 f0 fd ff ff       	call   103dd0 <install_trans>
  log.lh.n = 0;
  103fe0:	c7 05 b4 f7 10 00 00 	movl   $0x0,0x10f7b4
  103fe7:	00 00 00 
  write_head(); // clear the log
  103fea:	e8 5e ff ff ff       	call   103f4d <write_head>
}
  103fef:	90                   	nop
  103ff0:	c9                   	leave
  103ff1:	c3                   	ret

00103ff2 <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
  103ff2:	55                   	push   %ebp
  103ff3:	89 e5                	mov    %esp,%ebp
  
}
  103ff5:	90                   	nop
  103ff6:	5d                   	pop    %ebp
  103ff7:	c3                   	ret

00103ff8 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
  103ff8:	55                   	push   %ebp
  103ff9:	89 e5                	mov    %esp,%ebp
  103ffb:	83 ec 08             	sub    $0x8,%esp
  // call commit w/o holding locks, since not allowed
  // to sleep with locks.
  commit();
  103ffe:	e8 03 00 00 00       	call   104006 <commit>
}
  104003:	90                   	nop
  104004:	c9                   	leave
  104005:	c3                   	ret

00104006 <commit>:

/* DO NOT MODIFY THIS FUNCTION*/
static void
commit()
{
  104006:	55                   	push   %ebp
  104007:	89 e5                	mov    %esp,%ebp
  104009:	83 ec 08             	sub    $0x8,%esp
  if (log.lh.n > 0) {
  10400c:	a1 b4 f7 10 00       	mov    0x10f7b4,%eax
  104011:	85 c0                	test   %eax,%eax
  104013:	7e 19                	jle    10402e <commit+0x28>
    if (PANIC_1) {
      panic("[UNDOLOG] Panic in commit type 1");
    }
    write_head();    // Write header to disk 
  104015:	e8 33 ff ff ff       	call   103f4d <write_head>
    if (PANIC_2) {
      panic("[UNDOLOG] Panic in commit type 2");
    }
    install_trans(); // Now install writes to home locations    
  10401a:	e8 b1 fd ff ff       	call   103dd0 <install_trans>
    if (PANIC_3) {
      panic("[UNDOLOG] Panic in commit type 3");
    }
    log.lh.n = 0;
  10401f:	c7 05 b4 f7 10 00 00 	movl   $0x0,0x10f7b4
  104026:	00 00 00 
    write_head();    // Erase the transaction from the log 
  104029:	e8 1f ff ff ff       	call   103f4d <write_head>
    if (PANIC_4) {
      panic("[UNDOLOG] Panic in commit type 4");
    }  
  }
}
  10402e:	90                   	nop
  10402f:	c9                   	leave
  104030:	c3                   	ret

00104031 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
  104031:	55                   	push   %ebp
  104032:	89 e5                	mov    %esp,%ebp
  104034:	83 ec 18             	sub    $0x18,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
  104037:	a1 b4 f7 10 00       	mov    0x10f7b4,%eax
  10403c:	83 f8 1d             	cmp    $0x1d,%eax
  10403f:	7f 12                	jg     104053 <log_write+0x22>
  104041:	a1 b4 f7 10 00       	mov    0x10f7b4,%eax
  104046:	8b 15 a4 f7 10 00    	mov    0x10f7a4,%edx
  10404c:	83 ea 01             	sub    $0x1,%edx
  10404f:	39 d0                	cmp    %edx,%eax
  104051:	7c 0d                	jl     104060 <log_write+0x2f>
    panic("too big a transaction");
  104053:	83 ec 0c             	sub    $0xc,%esp
  104056:	68 9b 45 10 00       	push   $0x10459b
  10405b:	e8 4d c2 ff ff       	call   1002ad <panic>

  for (i = 0; i < log.lh.n; i++) {
  104060:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  104067:	eb 1d                	jmp    104086 <log_write+0x55>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
  104069:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10406c:	83 c0 04             	add    $0x4,%eax
  10406f:	8b 04 85 a8 f7 10 00 	mov    0x10f7a8(,%eax,4),%eax
  104076:	89 c2                	mov    %eax,%edx
  104078:	8b 45 08             	mov    0x8(%ebp),%eax
  10407b:	8b 40 08             	mov    0x8(%eax),%eax
  10407e:	39 c2                	cmp    %eax,%edx
  104080:	74 10                	je     104092 <log_write+0x61>
  for (i = 0; i < log.lh.n; i++) {
  104082:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  104086:	a1 b4 f7 10 00       	mov    0x10f7b4,%eax
  10408b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  10408e:	7c d9                	jl     104069 <log_write+0x38>
  104090:	eb 01                	jmp    104093 <log_write+0x62>
      break;
  104092:	90                   	nop
  }
  log.lh.block[i] = b->blockno;
  104093:	8b 45 08             	mov    0x8(%ebp),%eax
  104096:	8b 40 08             	mov    0x8(%eax),%eax
  104099:	89 c2                	mov    %eax,%edx
  10409b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10409e:	83 c0 04             	add    $0x4,%eax
  1040a1:	89 14 85 a8 f7 10 00 	mov    %edx,0x10f7a8(,%eax,4)
  struct buf *from = lget(b->dev, b->blockno);  // cache block
  1040a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1040ab:	8b 50 08             	mov    0x8(%eax),%edx
  1040ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1040b1:	8b 40 04             	mov    0x4(%eax),%eax
  1040b4:	83 ec 08             	sub    $0x8,%esp
  1040b7:	52                   	push   %edx
  1040b8:	50                   	push   %eax
  1040b9:	e8 3c df ff ff       	call   101ffa <lget>
  1040be:	83 c4 10             	add    $0x10,%esp
  1040c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct buf *to = bread(b->dev, log.start+i+1);
  1040c4:	8b 15 a0 f7 10 00    	mov    0x10f7a0,%edx
  1040ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1040cd:	01 d0                	add    %edx,%eax
  1040cf:	83 c0 01             	add    $0x1,%eax
  1040d2:	89 c2                	mov    %eax,%edx
  1040d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1040d7:	8b 40 04             	mov    0x4(%eax),%eax
  1040da:	83 ec 08             	sub    $0x8,%esp
  1040dd:	52                   	push   %edx
  1040de:	50                   	push   %eax
  1040df:	e8 cd df ff ff       	call   1020b1 <bread>
  1040e4:	83 c4 10             	add    $0x10,%esp
  1040e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  memmove(to->data, from->data, BSIZE);
  1040ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1040ed:	8d 50 1c             	lea    0x1c(%eax),%edx
  1040f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1040f3:	83 c0 1c             	add    $0x1c,%eax
  1040f6:	83 ec 04             	sub    $0x4,%esp
  1040f9:	68 00 02 00 00       	push   $0x200
  1040fe:	52                   	push   %edx
  1040ff:	50                   	push   %eax
  104100:	e8 61 ce ff ff       	call   100f66 <memmove>
  104105:	83 c4 10             	add    $0x10,%esp
  bwrite(to);
  104108:	83 ec 0c             	sub    $0xc,%esp
  10410b:	ff 75 ec             	push   -0x14(%ebp)
  10410e:	e8 d7 df ff ff       	call   1020ea <bwrite>
  104113:	83 c4 10             	add    $0x10,%esp
  lrelse(from);
  104116:	83 ec 0c             	sub    $0xc,%esp
  104119:	ff 75 f0             	push   -0x10(%ebp)
  10411c:	e8 ef df ff ff       	call   102110 <lrelse>
  104121:	83 c4 10             	add    $0x10,%esp
  brelse(to);
  104124:	83 ec 0c             	sub    $0xc,%esp
  104127:	ff 75 ec             	push   -0x14(%ebp)
  10412a:	e8 e3 e0 ff ff       	call   102212 <brelse>
  10412f:	83 c4 10             	add    $0x10,%esp
  if (i == log.lh.n)
  104132:	a1 b4 f7 10 00       	mov    0x10f7b4,%eax
  104137:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  10413a:	75 0d                	jne    104149 <log_write+0x118>
    log.lh.n++;
  10413c:	a1 b4 f7 10 00       	mov    0x10f7b4,%eax
  104141:	83 c0 01             	add    $0x1,%eax
  104144:	a3 b4 f7 10 00       	mov    %eax,0x10f7b4
  b->flags |= B_DIRTY; // prevent eviction
  104149:	8b 45 08             	mov    0x8(%ebp),%eax
  10414c:	8b 00                	mov    (%eax),%eax
  10414e:	83 c8 04             	or     $0x4,%eax
  104151:	89 c2                	mov    %eax,%edx
  104153:	8b 45 08             	mov    0x8(%ebp),%eax
  104156:	89 10                	mov    %edx,(%eax)
  104158:	90                   	nop
  104159:	c9                   	leave
  10415a:	c3                   	ret
