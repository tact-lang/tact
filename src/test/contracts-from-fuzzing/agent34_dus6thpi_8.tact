contract TestRawSliceDirect {
    // Testing rawSlice() without performing any operations on the resulting Slice.
    // This tests successful compile-time embedding of hex-encoded Slice from rawSlice.
    stored: Slice = rawSlice("4a");
    
    receive() {}
}
