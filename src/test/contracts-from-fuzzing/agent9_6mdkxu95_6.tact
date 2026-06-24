contract TestContract {
    receive() {}

    receive("testCell") {
        dump(emptyCell());
        dump(beginCell());
        dump(emptySlice());
    }
}
