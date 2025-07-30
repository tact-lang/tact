contract TestCellRuntime {
    data: Cell;

    init() {
        self.data = beginCell().storeUint(0xDEADBEEF, 32).endCell();
    }

    receive() {}

    get fun getData(): Cell {
         return self.data;
    }
}
