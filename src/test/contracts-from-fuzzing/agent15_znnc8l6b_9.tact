contract Test {
    receive() {
        let s: String = "AsSlice conversion";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
        // Checking equality, but simply using s2 to avoid unused variable warning
        if (s == s2) {
            s2;
        } else {
            s;
        }
    }
}
