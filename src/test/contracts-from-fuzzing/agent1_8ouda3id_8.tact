contract Test6 {
    receive() {}

    // Getter returning a slice (empty slice in this case)
    get fun getSlice(): Slice {
        return emptySlice();
    }
}
