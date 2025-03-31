contract TestSliceGetter {
    cell_val: Cell;

    init() {
        self.cell_val = beginCell().storeUint(123, 8).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.cell_val.asSlice();
    }
}
