contract OptCells {
    c: Cell? = null;
    s: Slice? = null;

    receive() {
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
    }
}