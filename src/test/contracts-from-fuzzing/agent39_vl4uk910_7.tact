contract Test5Fixed {
    data: Cell;
    
    init() {
        self.data = beginCell().storeUint(123, 8).endCell();
    }

    receive() {}

    get fun getData(): Cell {
        return self.data;
    }
}
