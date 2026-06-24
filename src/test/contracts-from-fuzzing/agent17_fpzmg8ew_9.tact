contract GetterSlice {
    s: Slice;

    init() {
        let c: Cell = beginCell().storeInt(99, 16).endCell();
        self.s = c.asSlice();
    }

    // Getter returning a Slice type
    get fun getSlice(): Slice {
        return self.s;
    }

    receive() {}
}
