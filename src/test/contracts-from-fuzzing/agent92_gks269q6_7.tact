contract TestStringSliceConversion {
    receive() {
        // Testing conversion: String -> Slice -> String
        let s: String = "Tact String";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
        if (s == s2) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
