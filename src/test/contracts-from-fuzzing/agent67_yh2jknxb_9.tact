contract TestAsSliceConversion {
    receive() {
        let s: String = "Tact test";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
        dump(s == s2);
    }
}
