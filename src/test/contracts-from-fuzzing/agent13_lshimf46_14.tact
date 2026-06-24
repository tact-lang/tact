contract TestRawSlice {
    receive() {
        // Testing the rawSlice function with bit-padding (underscore) in the hex string
        let s: Slice = rawSlice("4a_");
        dump(s.hash());
    }
}
