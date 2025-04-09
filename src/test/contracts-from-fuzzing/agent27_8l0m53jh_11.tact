contract Test8 {
    receive() {}

    // Getter returning a Slice from a built Cell
    get fun getSlice(): Slice {
        let c: Cell = beginCell().storeUint(55, 8).endCell();
        return c.asSlice();
    }
}
