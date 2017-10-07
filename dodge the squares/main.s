	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, #67108864
	mov	r6, #0
	ldr	r1, .L3
	ldr	r3, .L3+4
	strh	r1, [r2]	@ movhi
	str	r6, [r3]
	add	r2, r2, #256
	ldr	r3, .L3+8
	ldrh	lr, [r2, #48]
	ldr	ip, .L3+12
	ldr	r1, .L3+16
	sub	sp, sp, #8
	mov	r0, r3
	ldr	r2, .L3+20
	strh	lr, [ip]	@ movhi
	strh	r3, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, #992
	mov	r1, r6
	str	r3, [sp]
	mov	r2, #15
	mov	r3, #240
	mov	r0, #145
	ldr	r4, .L3+24
	mov	lr, pc
	bx	r4
	ldr	r10, .L3+28
	ldr	r3, .L3+32
	ldr	r2, .L3+36
	ldr	r8, .L3+40
	str	r6, [r3]
	strh	r6, [r2]	@ movhi
	str	r6, [r10]
	mov	lr, pc
	bx	r8
	mov	r5, #1
	mov	r4, #3
	ldr	r7, .L3+44
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	ldr	r9, .L3+48
	ldr	r2, [r10]
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, asl #1
	str	r3, [r10, #4]
	str	r3, [r10, #12]
	str	r2, [r10, #8]
	str	r5, [r10, #16]
	str	r4, [r10, #20]
	str	r6, [r9]
	mov	lr, pc
	bx	r8
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	rsb	r2, r3, r2, asr #4
	add	r2, r2, r2, lsl #2
	add	r2, r2, r2, lsl #2
	ldr	r10, .L3+52
	ldr	r3, [r9]
	sub	r2, r0, r2, asl #1
	add	r2, r2, #50
	str	r2, [r9, #4]
	str	r2, [r9, #12]
	str	r3, [r9, #8]
	str	r6, [r10]
	str	r5, [r9, #16]
	str	r4, [r9, #20]
	mov	lr, pc
	bx	r8
	mov	r6, #2
	mov	ip, #135
	mov	r1, #110
	mov	lr, #10
	smull	r2, r3, r7, r0
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	r2, .L3+56
	sub	r3, r0, r3, asl #1
	ldr	r0, [r10]
	add	r3, r3, #100
	str	r5, [r10, #16]
	str	r4, [r10, #20]
	str	r0, [r10, #8]
	str	r3, [r10, #4]
	str	r3, [r10, #12]
	str	ip, [r2]
	str	ip, [r2, #8]
	str	r6, [r2, #16]
	str	lr, [r2, #20]
	str	r1, [r2, #4]
	str	r1, [r2, #12]
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	1027
	.word	state
	.word	32736
	.word	buttons
	.word	bgColor
	.word	fillScreen
	.word	drawRect
	.word	sCube1
	.word	collected
	.word	oldButtons
	.word	rand
	.word	1374389535
	.word	sCube2
	.word	sCube3
	.word	wCube
	.size	initialize, .-initialize
	.align	2
	.type	lose.part.3, %function
lose.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	initialize
.L9:
	.align	2
.L8:
	.word	buttons
	.size	lose.part.3, .-lose.part.3
	.set	pause.part.1,lose.part.3
	.set	win.part.2,lose.part.3
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	rsb	r3, r0, r0, lsl #5
	add	r0, r0, r3, lsl #2
	add	r0, r0, r0, lsl #2
	mov	r0, r0, asl #4
	sub	sp, sp, #8
	cmp	r0, r2
	str	r2, [sp, #4]
	ble	.L10
.L12:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L12
.L10:
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L60
	ldrh	r2, [r3, #48]
	ldr	r7, .L60+4
	tst	r2, #16
	sub	sp, sp, #40
	ldr	r2, [r7, #4]
	bne	.L18
	cmp	r2, #229
	bgt	.L19
	ldr	r3, [r7, #16]
	add	r2, r2, r3
	str	r2, [r7, #4]
.L18:
	ldr	r3, .L60
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L54
.L20:
	ldr	r5, .L60+8
	ldr	ip, [r7, #20]
	ldr	lr, [r7]
	ldr	r3, [r5, #20]
	str	r2, [sp, #4]
	ldmia	r5, {r0, r1}
	mov	r2, r3
	str	ip, [sp, #12]
	str	ip, [sp, #8]
	str	lr, [sp]
	ldr	r9, .L60+12
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldr	r2, .L60+4
	bne	.L55
.L21:
	ldr	r4, .L60+16
	ldr	ip, [r7, #20]
	ldr	r3, [r4, #20]
	ldr	r6, [r7, #4]
	ldr	lr, [r7]
	ldmia	r4, {r0, r1}
	mov	r2, r3
	str	ip, [sp, #12]
	stmib	sp, {r6, ip}
	str	lr, [sp]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L56
.L25:
	ldr	r6, .L60+20
	ldr	ip, [r7, #20]
	ldr	r3, [r6, #20]
	ldr	r8, [r7, #4]
	ldr	lr, [r7]
	ldmia	r6, {r0, r1}
	mov	r2, r3
	str	ip, [sp, #12]
	stmib	sp, {r8, ip}
	str	lr, [sp]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldr	r2, .L60+4
	bne	.L57
.L26:
	ldr	r3, [r5]
	cmp	r3, #141
	ldr	r7, .L60+8
	bgt	.L58
.L30:
	ldr	r3, [r4]
	cmp	r3, #141
	ldr	r7, .L60+16
	bgt	.L59
.L31:
	ldr	r0, [r6]
	cmp	r0, #136
	ldr	r7, .L60+20
	ble	.L32
	mov	r2, #0
	ldr	r3, .L60+24
	str	r2, [r7]
	mov	lr, pc
	bx	r3
	ldr	r2, .L60+28
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, asl #4
	str	r0, [r7, #4]
	ldr	r0, [r7]
.L32:
	ldr	r1, [r5]
	ldr	r3, [r5, #16]
	ldr	r2, [r4]
	add	r1, r1, r3
	ldr	ip, [r4, #16]
	ldr	r3, [r6, #16]
	add	r2, r2, ip
	add	r3, r3, r0
	str	r1, [r5]
	str	r2, [r4]
	str	r3, [r6]
	add	sp, sp, #40
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L54:
	cmp	r2, #0
	ble	.L20
.L33:
	ldr	r3, [r7, #16]
	rsb	r2, r3, r2
	str	r2, [r7, #4]
	b	.L20
.L19:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L33
	b	.L20
.L55:
	ldr	r3, [r2, #20]
	ldr	ip, .L60+32
	ldmia	r2, {r0, r1}
	ldr	r8, .L60+36
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	mov	r3, #0
	ldr	r6, .L60+40
	str	r3, [sp, #24]
.L22:
	ldr	r3, [sp, #24]
	subs	r6, r6, #1
	add	r3, r3, #1
	str	r3, [sp, #24]
	bne	.L22
	ldr	r3, [r7, #20]
	ldr	ip, .L60+44
	ldmia	r7, {r0, r1}
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	ldr	r4, .L60+40
	str	r6, [sp, #20]
.L23:
	ldr	r3, [sp, #20]
	subs	r4, r4, #1
	add	r3, r3, #1
	str	r3, [sp, #20]
	bne	.L23
	ldr	r3, [r7, #20]
	ldr	ip, .L60+32
	ldmia	r7, {r0, r1}
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	str	r4, [sp, #16]
	ldr	r2, .L60+40
.L24:
	ldr	r3, [sp, #16]
	subs	r2, r2, #1
	add	r3, r3, #1
	str	r3, [sp, #16]
	bne	.L24
	ldr	r3, .L60+24
	str	r2, [r5]
	mov	lr, pc
	bx	r3
	mov	r1, #3
	ldr	r2, .L60+28
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	ldr	r2, .L60+48
	sub	r0, r0, r3, asl #4
	str	r0, [r5, #4]
	str	r1, [r2]
	b	.L21
.L59:
	mov	r2, #0
	ldr	r3, .L60+24
	str	r2, [r7]
	mov	lr, pc
	bx	r3
	ldr	r2, .L60+28
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, asl #4
	str	r0, [r7, #4]
	b	.L31
.L58:
	mov	r2, #0
	ldr	r3, .L60+24
	str	r2, [r7]
	mov	lr, pc
	bx	r3
	ldr	r2, .L60+28
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, asl #4
	str	r0, [r7, #4]
	b	.L30
.L57:
	ldr	r3, [r2, #20]
	ldr	ip, .L60+32
	ldmia	r2, {r0, r1}
	ldr	r8, .L60+36
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	mov	r3, #0
	ldr	r10, .L60+40
	str	r3, [sp, #36]
.L27:
	ldr	r3, [sp, #36]
	subs	r10, r10, #1
	add	r3, r3, #1
	str	r3, [sp, #36]
	bne	.L27
	ldr	r3, [r7, #20]
	ldr	ip, .L60+44
	ldmia	r7, {r0, r1}
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	ldr	r9, .L60+40
	str	r10, [sp, #32]
.L28:
	ldr	r3, [sp, #32]
	subs	r9, r9, #1
	add	r3, r3, #1
	str	r3, [sp, #32]
	bne	.L28
	ldr	r3, [r7, #20]
	ldr	ip, .L60+32
	ldmia	r7, {r0, r1}
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	str	r9, [sp, #28]
	ldr	r2, .L60+40
.L29:
	ldr	r3, [sp, #28]
	subs	r2, r2, #1
	add	r3, r3, #1
	str	r3, [sp, #28]
	bne	.L29
	ldr	r3, .L60+24
	str	r2, [r6]
	mov	lr, pc
	bx	r3
	mov	r1, #3
	ldr	r2, .L60+28
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	ldr	r2, .L60+48
	sub	r0, r0, r3, asl #4
	str	r0, [r6, #4]
	str	r1, [r2]
	b	.L26
.L56:
	mov	r2, #0
	ldr	r3, .L60+24
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+28
	smull	r2, r3, r0, r3
	ldr	r1, .L60+52
	add	r2, r3, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #7
	ldr	r2, [r1]
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, asl #4
	add	r3, r2, #1
	str	r0, [r4, #4]
	str	r3, [r1]
	b	.L25
.L61:
	.align	2
.L60:
	.word	67109120
	.word	wCube
	.word	sCube1
	.word	collision
	.word	sCube2
	.word	sCube3
	.word	rand
	.word	-2004318071
	.word	1023
	.word	drawRect
	.word	20000
	.word	31775
	.word	state
	.word	collected
	.size	update, .-update
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L69
	stmfd	sp!, {r4, lr}
	ldr	r0, .L69+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L62
	ldr	r3, .L69+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
.L62:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L68:
	bl	initialize
	mov	r2, #1
	ldr	r3, .L69+16
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L70:
	.align	2
.L69:
	.word	fillScreen
	.word	32767
	.word	oldButtons
	.word	buttons
	.word	state
	.size	start, .-start
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L79
	sub	sp, sp, #8
	ldr	r0, .L79+4
	ldr	r6, .L79+8
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L72
	ldr	r2, .L79+12
	ldrh	r1, [r2]
	ands	r5, r1, #4
	beq	.L78
.L72:
	tst	r3, #8
	beq	.L71
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	b	pause.part.1
.L71:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L78:
	mov	r2, #1
	ldr	r1, .L79+16
	ldr	r3, .L79+20
	ldrh	r0, [r1]
	str	r2, [r3]
	mov	lr, pc
	bx	r6
	mov	r3, #992
	mov	r1, r5
	str	r3, [sp]
	mov	r2, #15
	mov	r3, #240
	mov	r0, #145
	ldr	r5, .L79+24
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L72
.L80:
	.align	2
.L79:
	.word	oldButtons
	.word	15855
	.word	fillScreen
	.word	buttons
	.word	bgColor
	.word	state
	.word	drawRect
	.size	pause, .-pause
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L84
	stmfd	sp!, {r4, lr}
	mov	r0, #992
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	tst	r3, #8
	ldmnefd	sp!, {r4, lr}
	bne	win.part.2
.L81:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	fillScreen
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L89
	stmfd	sp!, {r4, lr}
	mov	r0, #31
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+4
	ldrh	r3, [r3]
	tst	r3, #8
	ldmnefd	sp!, {r4, lr}
	bne	lose.part.3
.L86:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	fillScreen
	.word	oldButtons
	.size	lose, .-lose
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #31
	ldr	r7, .L93
	ldr	r9, .L93+4
	ldr	r3, [r7, #20]
	ldrh	ip, [r9]
	sub	sp, sp, #8
	ldr	r6, .L93+8
	add	r0, r7, #8
	ldr	r8, .L93+12
	ldmia	r0, {r0, r1}
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r8
	ldrh	r2, [r9]
	ldr	r3, [r6, #20]
	ldr	r5, .L93+16
	add	r0, r6, #8
	ldmia	r0, {r0, r1}
	str	r2, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r8
	ldrh	r2, [r9]
	ldr	r3, [r5, #20]
	ldr	r4, .L93+20
	add	r0, r5, #8
	ldmia	r0, {r0, r1}
	str	r2, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r8
	ldrh	r2, [r9]
	ldr	r3, [r4, #20]
	add	r0, r4, #8
	ldmia	r0, {r0, r1}
	str	r2, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r8
	ldr	r3, [r7, #20]
	ldmia	r7, {r0, r1}
	mov	r2, r3
	str	r10, [sp]
	mov	lr, pc
	bx	r8
	ldr	r3, [r6, #20]
	ldr	ip, .L93+24
	ldmia	r6, {r0, r1}
	str	ip, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r8
	ldr	r3, [r5, #20]
	ldmia	r5, {r0, r1}
	mov	r2, r3
	str	r10, [sp]
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #20]
	ldr	ip, .L93+28
	ldmia	r4, {r0, r1}
	str	ip, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r8
	ldmia	r5, {r0, r1}
	ldmia	r4, {r2, r3}
	ldr	r9, [r7]
	ldr	r8, [r7, #4]
	ldr	lr, [r6]
	ldr	ip, [r6, #4]
	str	r9, [r7, #8]
	str	r8, [r7, #12]
	str	lr, [r6, #8]
	str	ip, [r6, #12]
	str	r0, [r5, #8]
	str	r1, [r5, #12]
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	sCube1
	.word	bgColor
	.word	sCube2
	.word	drawRect
	.word	sCube3
	.word	wCube
	.word	1023
	.word	31775
	.size	draw, .-draw
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L102
	ldrh	r3, [r3]
	tst	r3, #4
	stmfd	sp!, {r4, lr}
	beq	.L96
	ldr	r3, .L102+4
	ldrh	r3, [r3]
	tst	r3, #4
	moveq	r2, #2
	ldreq	r3, .L102+8
	streq	r2, [r3]
.L96:
	ldr	r3, .L102+12
	ldr	r3, [r3]
	cmp	r3, #5
	moveq	r2, #4
	ldreq	r3, .L102+8
	streq	r2, [r3]
	bl	update
	ldr	r3, .L102+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	draw
.L103:
	.align	2
.L102:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	collected
	.word	waitForVBlank
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r7, fp, lr}
	ldr	r7, .L116
	mov	lr, pc
	bx	r7
	ldr	r8, .L116+4
	ldr	r6, .L116+8
	ldr	r5, .L116+12
	ldr	fp, .L116+16
	ldr	r10, .L116+20
	ldr	r9, .L116+24
	ldr	r4, .L116+28
.L105:
	ldrh	r3, [r8]
	ldr	r2, [r6]
.L106:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L106
.L108:
	.word	.L107
	.word	.L109
	.word	.L110
	.word	.L111
	.word	.L112
.L112:
	ldr	r3, .L116+32
	mov	lr, pc
	bx	r3
	b	.L105
.L111:
	ldr	r3, .L116+36
	mov	lr, pc
	bx	r3
	b	.L105
.L110:
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r9
	b	.L105
.L109:
	mov	lr, pc
	bx	fp
	b	.L105
.L107:
	mov	lr, pc
	bx	r7
	b	.L105
.L117:
	.align	2
.L116:
	.word	start
	.word	buttons
	.word	state
	.word	oldButtons
	.word	game
	.word	pause
	.word	waitForVBlank
	.word	67109120
	.word	win
	.word	lose
	.size	main, .-main
	.comm	wCube,24,4
	.comm	sCube3,24,4
	.comm	sCube2,24,4
	.comm	sCube1,24,4
	.comm	collected,4,4
	.comm	state,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 45) 5.3.0"
