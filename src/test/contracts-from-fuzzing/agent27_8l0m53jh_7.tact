contract Test4 {
    receive() {}

    // Getter returning a Cell built from a builder
    get fun getCell(): Cell {
        return beginCell().storeUint(123, 8).endCell();
    }
}
