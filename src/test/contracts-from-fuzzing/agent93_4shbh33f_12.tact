contract TestStringAsSlice {
    receive() {
        // Test conversion from String to Slice and back to String
        let s: String = "It's alive! It's alive!!!";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
        if (s == s2) {
            // Equality holds
        }
    }
}
