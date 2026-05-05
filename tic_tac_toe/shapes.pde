void drawBoard() {
    stroke(0);
    strokeWeight(4);

    line(SQUARE_SIZE, 0, SQUARE_SIZE, height);
    line(SQUARE_SIZE * 2, 0, SQUARE_SIZE * 2, height);

    line(0, SQUARE_SIZE, width, SQUARE_SIZE);
    line(0, SQUARE_SIZE * 2, width, SQUARE_SIZE * 2);
}

void drawMoves() {
    for (int i = 0; i < 9; i++) {
    int row = i / 3;
    int col = i % 3;

    int x = col * SQUARE_SIZE;
    int y = row * SQUARE_SIZE;

    if (board[i] == COMPUTER) {
      drawX(x, y);
    } else if (board[i] == USER) {
      drawO(x, y);
    }
  }
}

void drawX(int x, int y) {
    stroke(0);
    strokeWeight(6);

    int padding = 40;

    line(x + padding, y + padding, x + SQUARE_SIZE - padding, y + SQUARE_SIZE - padding);
    line(x + SQUARE_SIZE - padding, y + padding, x + padding, y + SQUARE_SIZE - padding);
}

void drawO(int x, int y) {
    stroke(0);
    strokeWeight(6);
    noFill();

    int centerX = x + SQUARE_SIZE / 2;
    int centerY = y + SQUARE_SIZE / 2;

    ellipse(centerX, centerY, 90, 90);
}