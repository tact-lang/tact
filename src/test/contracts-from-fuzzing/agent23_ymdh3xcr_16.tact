contract TestStringAsSlice {
    receive() {
        // Testing that converting a string to a slice and back yields the original string (using asSlice and asString)
        let s: String = "Tact strings";
        let sl: Slice = s.asSlice();
        dump(sl.asString() == s);
    }
}
