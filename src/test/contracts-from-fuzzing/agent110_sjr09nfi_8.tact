contract TestSliceConversion {
    receive() {
        let s: String = "Conversion test";
        let s2: String = s.asSlice().asString();
        dump(s == s2);
    }
}
