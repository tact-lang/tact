contract TestSliceGetter {
    c: Cell;

    // Initialize the cell in init function instead of constant initialization
    init() {
        self.c = beginCell().storeUint(123, 8).endCell();
    }

    receive() {}

    // Getter returning a Slice derived from a state Cell
    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}
