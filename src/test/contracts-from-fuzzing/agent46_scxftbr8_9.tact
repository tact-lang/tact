contract GetterCell {
    c: Cell;
    
    init() {
        self.c = beginCell().storeUint(123, 32).endCell();
    }
    
    receive() {}
    
    // Getter returning a Cell
    get fun getCell(): Cell {
        return self.c;
    }
}
