contract Test {
    receive() {}

    get fun getCell(): Cell {
        return beginCell().storeUint(512, 16).endCell();
    }
}
