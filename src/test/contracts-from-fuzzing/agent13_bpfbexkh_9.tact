contract Test {
    // Getter function returning a Slice computed at runtime
    get fun getSlice(): Slice {
        let c = beginCell().storeUint(123, 8).endCell();
        return c.beginParse();
    }

    receive() {}
}
