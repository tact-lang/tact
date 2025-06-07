contract Test {
    receive() {
        dump(emptyCell());
        dump(beginCell());
        dump(emptySlice());
    }
}
