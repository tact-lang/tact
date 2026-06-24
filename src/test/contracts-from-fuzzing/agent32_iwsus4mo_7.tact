contract TestRawSliceValid1 {
    // Valid usage of 'rawSlice' without bit-padding
    s: Slice = rawSlice("4a"); // should load and yield a slice with corresponding bits

    receive () {}
}
