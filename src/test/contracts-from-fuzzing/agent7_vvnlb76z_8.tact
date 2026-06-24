contract TestCellGetter {
    c: Cell;
    
    init() {
        self.c = beginCell().storeUint(123, 8).endCell();
    }
    
    receive() {}
    
    get fun getCell(): Cell {
        return self.c;
    }
}
