contract TestSliceGetter {
    receive() {}

    get fun getSlice(): Slice {
        let c: Cell = beginCell().storeUint(888, 16).endCell();
        return c.beginParse();
    }
}
