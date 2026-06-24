contract TestCells {
    receive() {
        dump(emptyCell());
        dump(beginCell());
        dump(emptySlice());
    }
}
