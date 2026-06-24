contract TestSlice {
    data: Cell;

    init() {
        self.data = beginCell().storeUint(12345, 16).endCell();
    }

    // Getter returning a Slice from the stored cell
    get fun getSlice(): Slice {
        return self.data.beginParse();
    }

    receive() {}
}
