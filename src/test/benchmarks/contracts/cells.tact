contract CellsCreation {
    receive() { }

    get fun getEmptyCell(): Cell {
        return emptyCell();
    }

    get fun getEmptySlice(): Slice {
        return emptySlice();
    }
}
