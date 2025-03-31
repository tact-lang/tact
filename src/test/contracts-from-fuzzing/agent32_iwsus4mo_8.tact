contract TestRawSliceBit {
    // Testing 'rawSlice' with bit-padding (indicated by trailing underscore)
    s: Slice = rawSlice("4a_");
    
    receive () {}
}
