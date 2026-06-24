contract TestGetterCell {
    data: Cell;

    init() {
        self.data = beginCell().storeUint(777, 32).endCell();
    }

    receive() {}

    get fun getCell(): Cell {
        return self.data;
    }
}
