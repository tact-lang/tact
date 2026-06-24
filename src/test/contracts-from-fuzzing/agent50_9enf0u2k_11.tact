contract TestSlice {
    c: Cell;

    init() {
        self.c = beginCell().storeInt(42, 32).endCell();
    }

    receive() {}

    // Getter that returns a Slice from the stored cell
    get fun getSlice(): Slice {
        return self.c.asSlice();
    }
}
