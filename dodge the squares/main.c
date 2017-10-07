#include "myLib.h"
#include <stdio.h>
// 
// Prototypes
void initialize();
void delay();
void update();
void draw();
void start();
void game();
void pause();
void win();
void lose();
int rand();
// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Background Variables
unsigned short bgColor;

int state;
int collected;
enum {START, GAME, PAUSE, LOSE, WIN};
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int length;
} CUBE;

CUBE sCube1;
CUBE sCube2;
CUBE sCube3;
CUBE wCube;
int main() {

	start();
	while(1) {

		oldButtons = buttons;
		buttons = BUTTONS;
		switch(state) { 
			case 0:
				start();
				break; 
			case 1:
				game();
				break; 
			case 2:
				pause(); 
				waitForVBlank();
				break;
			case 3: 
				lose();
				break; 
			case 4:
				win(); 
				break;
		} 

	}
}

// Sets up the display and the game objects
void initialize() {

	REG_DISPCTL = MODE3 | BG2_ENABLE;
	state = START;
	buttons = BUTTONS;

	bgColor = CYAN;
	fillScreen(bgColor);
	drawRect(145, 0, 15, 240, GREEN);

	oldButtons = 0;
	collected = 0;
	//star no.1
	sCube1.row = 0;
	sCube1.col = rand() % 50;
	sCube1.oldRow = sCube1.row;
	sCube1.oldCol = sCube1.col;
	sCube1.rdel = 1;
	sCube1.length = 3;
	// //star no.2
	sCube2.row = 0;
	sCube2.col = rand() % 50 + 50;
	sCube2.oldRow = sCube2.row;
	sCube2.oldCol = sCube2.col;
	sCube2.rdel = 1;
	sCube2.length = 3;

	// //star no.2
	sCube3.row = 0;
	sCube3.col = rand() % 50 + 100;
	sCube3.oldRow = sCube3.row;
	sCube3.oldCol = sCube3.col;
	sCube3.rdel = 1;
	sCube3.length = 3;

	wCube.row = 135;
	wCube.col = 110;
	wCube.oldRow = wCube.row;
	wCube.oldCol = wCube.col;
	wCube.rdel = 2;
	wCube.length = 10;
}
void delay(int num) {
	volatile int trash = 0;
	for (int i = 0; i < (10000 * num); i++) {
		trash++;
	}
}
// Performs all of the game's calculations
void update() {
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		if (wCube.col < 230) {
			wCube.col += wCube.rdel;
		}
	}
	if (BUTTON_HELD(BUTTON_LEFT)) {
		if (wCube.col > 0) {
			wCube.col -= wCube.rdel;
		}
		
	}

	if (collision(sCube1.row, sCube1.col, sCube1.length, sCube1.length, wCube.row, wCube.col, wCube.length, wCube.length)) {
		drawRect(wCube.row, wCube.col, wCube.length, wCube.length, YELLOW);
		delay(2);
		drawRect(wCube.row, wCube.col, wCube.length, wCube.length, MAGENTA);
		delay(2);
		drawRect(wCube.row, wCube.col, wCube.length, wCube.length, YELLOW);
		delay(2);
		sCube1.row = 0;
		sCube1.col = rand() % 240;
		state = LOSE;

	}
	if (collision(sCube2.row, sCube2.col, sCube2.length, sCube2.length, wCube.row, wCube.col, wCube.length, wCube.length)) {
		sCube2.row = 0;
		sCube2.col = rand() % 240;
		collected++;
	}
	if (collision(sCube3.row, sCube3.col, sCube3.length, sCube3.length, wCube.row, wCube.col, wCube.length, wCube.length)) {
		drawRect(wCube.row, wCube.col, wCube.length, wCube.length, YELLOW);
		delay(2);
		drawRect(wCube.row, wCube.col, wCube.length, wCube.length, MAGENTA);
		delay(2);
		drawRect(wCube.row, wCube.col, wCube.length, wCube.length, YELLOW);
		delay(2);
		sCube3.row = 0;
		sCube3.col = rand() % 240;
		state = LOSE;
	}
	if (sCube1.row >= 142) {
		sCube1.row = 0;
		sCube1.col = rand() % 240;
	}
	if (sCube2.row >= 142) {
		sCube2.row = 0;
		sCube2.col = rand() % 240;
	}
	if (sCube3.row >= 137) {
		sCube3.row = 0;
		sCube3.col = rand() % 240;
	}
	sCube1.row += sCube1.rdel;
	sCube2.row += sCube2.rdel;
	sCube3.row += sCube3.rdel;
	
}
void start() {
	fillScreen(WHITE);
	if (BUTTON_PRESSED(BUTTON_START)) {
		initialize();
		state = GAME;
	}
}
void game() {
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		state = PAUSE;
	}
	if (collected == 5) {
		state = WIN;
	}
	update();
	waitForVBlank();
	draw();
	
}
void pause() {
	fillScreen(COLOR(15,15,15));
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		state = GAME;
		fillScreen(bgColor);
		drawRect(145, 0, 15, 240, GREEN);
	}
	if (BUTTON_PRESSED(BUTTON_START)) {
		initialize();
	}
}
void win() {
	fillScreen(GREEN);
	if (BUTTON_PRESSED(BUTTON_START)) {
		//collected = 0;
		initialize();
	}
}
void lose() {
	fillScreen(RED);
	if (BUTTON_PRESSED(BUTTON_START)) {
		initialize();
	}
}
// Performs all of the writing to the screen
void draw() {
	// Erase the previous locations
	drawRect(sCube1.oldRow, sCube1.oldCol, sCube1.length, sCube1.length, bgColor);
	drawRect(sCube2.oldRow, sCube2.oldCol, sCube2.length, sCube2.length, bgColor);
	drawRect(sCube3.oldRow, sCube3.oldCol, sCube3.length, sCube3.length, bgColor);
	drawRect(wCube.oldRow, wCube.oldCol, wCube.length, wCube.length, bgColor);

	// Draw the new locations
	drawRect(sCube1.row, sCube1.col, sCube1.length, sCube1.length, RED);
	drawRect(sCube2.row, sCube2.col, sCube2.length, sCube2.length, YELLOW);
	drawRect(sCube3.row, sCube3.col, sCube3.length, sCube3.length, RED);
	drawRect(wCube.row, wCube.col, wCube.length, wCube.length, MAGENTA);

	//	Update old variables
	sCube1.oldRow = sCube1.row;
	sCube1.oldCol = sCube1.col;
	sCube2.oldRow = sCube2.row;
	sCube2.oldCol = sCube2.col;
	sCube3.oldRow = sCube3.row;
	sCube3.oldCol = sCube3.col;
	wCube.oldRow = wCube.row;
	wCube.oldCol = wCube.col;
}