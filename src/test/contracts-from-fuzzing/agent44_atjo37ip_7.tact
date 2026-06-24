contract TestCell2 {
    c: Cell;
    
    init() {
        self.c = beginCell().storeUint(42, 8).endCell();
    }

    receive() {}

    get fun getCell(): Cell {
        return self.c;
    }
}
