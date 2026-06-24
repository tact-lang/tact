contract TestGetterCell2 {
    data: Cell;

    init() {
        self.data = beginCell().storeUint(123, 32).endCell();
    }

    receive() {}

    get fun getData(): Cell {
        return self.data;
    }
}
