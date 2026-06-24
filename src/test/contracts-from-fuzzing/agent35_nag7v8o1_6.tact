contract TestSlice {
    c: Cell;

    init() {
        self.c = beginCell()
            .storeUint(42, 8)
            .endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.c.asSlice();
    }
}
