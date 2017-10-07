#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {
    for (int i =0;i<height;i++){
		for (int j =0; j<width;j++){
			setPixel(row + i, col + j, color);
		}
	}
}

void fillScreen(unsigned short color) {
	for (int i = 0; i < 38400; i++) {
		videoBuffer[i] = color;
	}
}

void waitForVBlank() {
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {
    return ((rowA <= (rowB + widthB - 1)) && ((rowA + widthA - 1) >= rowB) && (colA <= (colB + heightB - 1)) && ((colA + heightA - 1) >= colB));
    	
}