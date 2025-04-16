contract TestCasting {
    receive() {
        // Convert a string to a slice and then back to a string using extension functions
        let s: String = "Hello, Tact Casting!";
        let slice: Slice = s.asSlice();
        let s2: String = slice.asString();
        dump(s2);
    }
}
