contract Test {
    receive() {
        // Test chaining of asSlice() and asString() for string equality
        let s: String = "the quick brown fox";
        let s2: String = s.asSlice().asString();
        if (s == s2) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
