char[] board = new char[9];
boolean gameEnded = false;

void initializeGame() {
  for (int i = 0; i < 9; i++) {
    board[i] = BLANK;
  }

  println("Computer starts.");
  computerTurn();
}

void keyPressed() {
  if (gameEnded) {
    println("The game has ended.");
    return;
  }

  if (key < '0' || key > '8') {
    println("Incorrect key pressed.");
    return;
  }

  int square = key - '0';

  if (board[square] != BLANK) {
    println("That square is already taken.");
    return;
  }

  board[square] = USER;

  if (checkWinner(USER)) {
    println("The user has won.");
    gameEnded = true;
    return;
  }

  if (boardFull()) {
    println("No one has won.");
    gameEnded = true;
    return;
  }

  println("The game is still in play.");

  computerTurn();

  if (checkWinner(COMPUTER)) {
    println("The computer has won.");
    gameEnded = true;
    return;
  }

  if (boardFull()) {
    println("No one has won.");
    gameEnded = true;
    return;
  }
}

void computerTurn() {
  int square = findComputerMove();

  if (square != -1) {
    board[square] = COMPUTER;
  }
}

int findComputerMove() {
  for (int i = 0; i < 9; i++) {
    if (board[i] == BLANK) {
      return i;
    }
  }

  return -1;
}

boolean checkWinner(char player) {
  if (board[0] == player && board[1] == player && board[2] == player) {
    return true;
  }

  if (board[3] == player && board[4] == player && board[5] == player) {
    return true;
  }

  if (board[6] == player && board[7] == player && board[8] == player) {
    return true;
  }

  if (board[0] == player && board[3] == player && board[6] == player) {
    return true;
  }

  if (board[1] == player && board[4] == player && board[7] == player) {
    return true;
  }

  if (board[2] == player && board[5] == player && board[8] == player) {
    return true;
  }

  if (board[0] == player && board[4] == player && board[8] == player) {
    return true;
  }

  if (board[2] == player && board[4] == player && board[6] == player) {
    return true;
  }

  return false;
}

boolean boardFull() {
  for (int i = 0; i < 9; i++) {
    if (board[i] == BLANK) {
      return false;
    }
  }

  return true;
}