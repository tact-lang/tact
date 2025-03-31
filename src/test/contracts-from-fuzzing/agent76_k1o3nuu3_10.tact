contract TestSlice {
    receive () {}

    get fun getSlice(): Slice {
        return emptyCell().asSlice();
    }
}
