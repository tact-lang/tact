contract CellGetter {
    data: Cell;

    init() {
        self.data = beginCell().storeUint(123, 8).endCell();
    }

    receive() {}

    get fun getCell(): Cell {
        return self.data;
    }
}
