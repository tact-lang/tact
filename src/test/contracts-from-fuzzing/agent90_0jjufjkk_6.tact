contract Test5_fixed {
    val: Cell;

    init() {
        self.val = beginCell().storeUint(123, 32).endCell();
    }

    get fun getCell(): Cell {
        return self.val;
    }

    receive() {}
}
