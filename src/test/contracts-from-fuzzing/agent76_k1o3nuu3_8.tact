contract TestCell {
    receive () {}

    get fun getCell(): Cell {
        return emptyCell();
    }
}
