contract TestStringAsSlice {
    receive() {
        // Testing conversion: String -> Slice -> String
        let s: String = "Test\nSlice";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
        dump(s == s2);
    }
}
