contract TestStringOps {
    receive() {
        let s: String = "Hello, Tact!";
        let slice1: Slice = s.asSlice();
        let s2: String = s.asSlice().asString();
        if (s == s2) {
            // Equal strings
        } else {
            // Not equal
        }
    }
}
