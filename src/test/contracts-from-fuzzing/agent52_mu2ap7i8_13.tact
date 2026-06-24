contract TestSliceGetter {
    c: Cell; // state variable to hold a cell

    init() {
        self.c = beginCell().storeUint(42, 8).endCell();
    }

    receive() {}

    // Getter returning a slice parsed from the cell
    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}
