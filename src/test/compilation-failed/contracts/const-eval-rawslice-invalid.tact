contract AsciiOverflow {
    get fun getRawSlice_fail(): Slice {
        return rawSlice("4a__");
    }
}