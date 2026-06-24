contract TestRawSlice {
    noPadding: Slice = rawSlice("4a");
    bitPadded: Slice = rawSlice("4a_");
    
    receive () {}
}
