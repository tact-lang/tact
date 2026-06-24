contract Test8 {
    receive() {}

    get fun getCell(): Cell {
        return beginCell().storeUint(42, 8).endCell();
    }
}
