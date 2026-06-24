contract TestRuntimeCell {
    // Getter that constructs a cell at runtime
    get fun getCell(): Cell {
        return beginCell().storeUint(888, 16).endCell();
    }

    receive() {}
}
