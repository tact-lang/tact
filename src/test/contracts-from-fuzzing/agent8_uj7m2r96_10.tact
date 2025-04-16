contract Test {
    // Valid rawSlice with bit-padding indicated by underscore.
    // This should embed a Slice at compile-time using bit-padded hex.
    s: Slice = rawSlice("4a_");
}
