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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	mov	r1, r1, asl #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	cmp	r2, #0
	ldrh	ip, [sp, #12]
	ble	.L4
	mov	r4, #0
	ldr	lr, .L14
	rsb	r0, r0, r0, lsl #4
	ldr	lr, [lr]
	add	r0, r1, r0, lsl #4
	add	lr, lr, r0, lsl #1
	mov	r5, r3, asl #1
.L8:
	cmp	r3, #0
	ble	.L9
	mov	r1, lr
	add	r0, lr, r5
.L7:
	strh	ip, [r1], #2	@ movhi
	cmp	r1, r0
	bne	.L7
.L9:
	add	r4, r4, #1
	cmp	r2, r4
	add	lr, lr, #480
	bne	.L8
.L4:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	ldr	r2, .L19+4
	ldr	r1, [r3]
	sub	r3, r1, #2
	add	r2, r1, r2
.L17:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L17
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.word	76798
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L22:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L22
	mov	r2, #67108864
.L24:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L24
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r0
	ble	.L31
	add	r0, r0, r3
	cmp	lr, r0
	blt	.L33
.L31:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L33:
	add	r0, sp, #8
	ldmia	r0, {r0, r3}
	add	r3, r3, r0
	cmp	r3, r1
	ble	.L31
	ldr	r3, [sp, #8]
	add	r0, r1, r2
	cmp	r3, r0
	movge	r0, #0
	movlt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 45) 5.3.0"
