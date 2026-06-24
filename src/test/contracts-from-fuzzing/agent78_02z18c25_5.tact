contract Test5 {
    receive () {}

    // Getter function returning a Cell
    get fun getCell(): Cell {
        return beginCell().storeUint(42, 8).endCell();
    }
}
