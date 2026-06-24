contract TestCellGetter {
    receive() {}
    
    // Getter returning a Cell that contains a uint stored in it
    get fun getCell(): Cell {
        let c: Cell = beginCell().storeUint(123, 8).endCell();
        return c;
    }
}
