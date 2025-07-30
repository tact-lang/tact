contract TestBuilderSlice {
    receive() {
        dump(beginCell());
        dump(emptySlice());
    }
}
