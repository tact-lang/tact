contract Test {
    receive() {}

    get fun getCell(): Cell {
        return beginCell().storeInt(123, 32).endCell();
    }
}
