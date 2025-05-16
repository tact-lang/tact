contract Test {
    receive() {}

    get fun getSlice(): Slice {
       return beginCell().asSlice();
    }
}
