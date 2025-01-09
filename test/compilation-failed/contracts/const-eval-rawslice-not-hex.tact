contract AsciiOverflow {
    get fun getRawSlice_fail(): Slice {
        return rawSlice("hello world");
    }
}