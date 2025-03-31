contract Test {
    receive() {
        // Convert string to slice and back, and compare
        let s: String = "Test String";
        let s2: String = s.asSlice().asString();
        if (s == s2) {
            dump("equality holds");
        } else {
            dump("equality fails");
        }
    }
}
