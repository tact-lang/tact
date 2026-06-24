contract TestContract {
    c: Cell;
    sl: Slice;

    init() {
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}