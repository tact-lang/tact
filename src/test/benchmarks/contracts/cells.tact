contract CellsCreation {
    receive() { }

    get fun emptyCell(): Cell {
        return emptyCell();
    }

    get fun emptySlice(): Slice {
        return emptySlice();
    }
}
