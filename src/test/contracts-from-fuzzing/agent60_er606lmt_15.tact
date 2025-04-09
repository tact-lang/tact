contract TestContract {
    receive() {
        // Testing conversion from String to Slice and back to String
        let s: String = "TestString";
        let s2: String = s.asSlice().asString();
        s == s2;
    }
}
