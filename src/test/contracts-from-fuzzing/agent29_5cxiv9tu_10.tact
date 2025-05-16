contract Test {
    get fun getCell(): Cell {
        return beginCell().storeUint(42, 8).endCell();
    }

    receive() {
        self.getCell();
    }
}
