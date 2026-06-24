contract TestConcat2 {
    receive() {
        // Test string concatenation using StringBuilder.concat and check equality via conditional dump
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello, ").concat("Tact!");
        let s: String = sb.toString();
        // Check equality by comparing asSlice representations
        if (s.asSlice() == "Hello, Tact!".asSlice()) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
