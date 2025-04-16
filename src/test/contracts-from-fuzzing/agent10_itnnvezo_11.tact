contract Test6 {
    c: Cell;  
    
    init() {
        self.c = beginCell().endCell();
    }
    
    get fun getCell(): Cell {
         return self.c;
    }
    
    receive() {}
}
