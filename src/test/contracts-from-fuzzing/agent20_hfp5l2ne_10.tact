contract TestCellFixed {
    c: Cell;
    
    init() {
        self.c = emptyCell();
    }
    
    receive() {}
    
    get fun getCell(): Cell {
         return self.c;
    }
}
