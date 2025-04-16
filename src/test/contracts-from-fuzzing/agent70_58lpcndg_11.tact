contract TestContract {
    receive() {
        // Testing String.asSlice and conversion to String
        let s: String = "It's alive! It's alive!!!";
        let slice1: Slice = s.asSlice();
        let s2: String = slice1.asString();
        dump(s == s2);
    }
}
