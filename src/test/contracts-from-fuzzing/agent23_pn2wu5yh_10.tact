contract GetterSlice {
    receive() {}

    // Getter function that returns a Slice obtained from the default cell
    get fun getSlice(): Slice {
        return beginCell().endCell().beginParse();
    }
}
