contract SliceGetter {
    c: Cell;

    init() {
        // Initialize c with a cell containing an 8-bit unsigned integer value 123
        self.c = beginCell().storeUint(123, 8).endCell();
    }

    receive() {}

    // Getter that returns a slice from the stored cell
    get fun getSlice(): Slice {
        return self.c.asSlice();
    }
}
