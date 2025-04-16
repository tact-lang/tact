contract TestGetCellInit {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(123, 32).endCell();
    }

    receive() {}

    get fun getCell(): Cell {
        return self.c;
    }
}
