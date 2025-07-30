contract TestSliceGetter {
    receive() {}

    // Getter returning a Slice extracted from a Cell using asSlice()
    get fun getSlice(): Slice {
        let c: Cell = beginCell().storeUint(5, 4).endCell();
        return c.asSlice();
    }
}
