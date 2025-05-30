contract TestSlice {
    receive() {}

    get fun getSlice(): Slice {
        let c = beginCell().storeUint(123, 32).endCell();
        return c.beginParse();
    }
}
