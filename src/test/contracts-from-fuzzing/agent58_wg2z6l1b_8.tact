contract TestSlice {
    data: Cell;

    init() {
        // Initialize a cell with a 32-bit unsigned integer
        self.data = beginCell().storeUint(123, 32).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.data.asSlice();
    }
}
