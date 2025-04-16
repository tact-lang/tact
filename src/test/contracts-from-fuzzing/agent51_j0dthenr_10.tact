contract TestCellGetter2 {
    receive() {}

    get fun getCell(): Cell {
        return beginCell().storeUint(456, 16).endCell();
    }
}
