contract Test {
    // Getter returning a Slice constructed at runtime from a Cell
    get fun getSlice(): Slice {
        let c: Cell = beginCell().storeUint(999, 32).endCell();
        return c.beginParse();
    }

    receive() {}
}
