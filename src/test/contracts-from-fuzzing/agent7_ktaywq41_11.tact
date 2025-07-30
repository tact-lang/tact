contract Test {
    // Testing compile-time function rawSlice() with a valid bit-padded hex string
    // Here we only assign the rawSlice to a state variable without invoking any methods
    s: Slice = rawSlice("4a_");

    receive() {}
}
