contract ManyCells {
    c1: Cell;
    c2: Cell;
    c3: Cell;
    c4: Cell;

    init() {
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.c3 = emptyCell();
        self.c4 = emptyCell();
    }
}