contract Test {
    // Getter function returning a Cell computed at runtime
    get fun getCell(): Cell {
        let b = beginCell().storeUint(42, 8);
        return b.endCell();
    }
    
    receive() {}
}
