contract TestRawSlice {
    // Using a compile-time function to obtain a Slice from a raw hexadecimal string
    const RS: Slice = rawSlice("000DEADBEEF000");

    // Getter function to expose the compile-time computed Slice constant
    get fun getRS(): Slice {
        return self.RS;
    }

    // Dummy receiver
    receive() { return; }
}
