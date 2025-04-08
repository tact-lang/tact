contract CellFields {
    c1: Cell;
    c2: Cell?;

    init() {
        self.c1 = emptyCell();
        self.c2 = null;
    }
}