contract TestCellReturn {
    c: Cell;
    
    init() {
        self.c = beginCell().storeUint(255, 8).endCell();
    }
    
    receive() {}
    
    get fun getC(): Cell {
        return self.c;
    }
}
