contract TestCellReturn {
    c: Cell;

    init() {
         self.c = beginCell().storeUint(777, 16).endCell();
    }

    receive() {}

    get fun get_cell(): Cell {
         return self.c;
    }
}
