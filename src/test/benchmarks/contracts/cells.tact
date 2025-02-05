contract cellsCreation {
    receive(msg: Slice) {

    }
    get fun getEmptyCell(): Cell {
        return emptyCell();
    }
    get fun getEmptySlice(): Slice {
        return emptySlice();
    }
}
