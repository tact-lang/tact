contract TestSlice {
    // Initialize state variable s of type Slice using rawSlice with a hex string literal
    s: Slice = rawSlice("2A");

    receive() {}

    // Getter returning a Slice
    get fun getSlice(): Slice {
        return self.s;
    }
}
