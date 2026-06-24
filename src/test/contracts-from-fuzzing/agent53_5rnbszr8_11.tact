contract TestReturnCell {
    c: Cell;
    
    init() {
        self.c = beginCell().storeUint(123, 32).endCell();
    }

    get fun getCell(): Cell {
        return self.c;
    }

    receive() {
        let cellRes = self.getCell();
    }
}
