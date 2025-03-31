contract TestCellGetter {
    cellVal: Cell;

    init() {
        self.cellVal = beginCell().storeUint(42, 32).endCell();
    }
    
    receive() {}
    
    get fun getCell(): Cell {
         return self.cellVal;
    }
}
