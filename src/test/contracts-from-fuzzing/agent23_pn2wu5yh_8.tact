contract GetterCell {
    receive() {}

    // Getter function that returns a Cell obtained from a builder
    get fun getCell(): Cell {
        return beginCell().endCell();
    }
}
