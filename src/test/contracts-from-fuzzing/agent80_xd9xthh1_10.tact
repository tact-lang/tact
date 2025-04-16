contract Test {
    data: Cell;

    init() {
        self.data = beginCell().storeUint(42, 8).endCell();
    }

    get fun getData(): Cell {
        return self.data;
    }

    receive() {}
}
