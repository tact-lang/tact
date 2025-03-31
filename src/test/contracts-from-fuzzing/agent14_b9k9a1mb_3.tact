contract TestRawSlice {
    get fun getByte(): Int {
         let s: Slice = rawSlice("4a");
         return s.loadUint(8); // should return 74 if not bit-padded
    }
}
