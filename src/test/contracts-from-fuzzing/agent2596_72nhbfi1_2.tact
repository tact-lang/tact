contract InitNonConst {
    c: Cell;

    init() {
        self.c = emptyCell();
    }
}