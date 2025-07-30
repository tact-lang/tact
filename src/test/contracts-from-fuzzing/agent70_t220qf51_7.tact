contract TestGetSlice {
    receive() {}

    get fun getSlice(): Slice {
        return emptySlice();
    }
}
