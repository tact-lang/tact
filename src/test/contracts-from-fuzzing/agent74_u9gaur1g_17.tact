contract TestContract {
    receive() {
        // Testing conversion of a string to slice and back to string
        let s: String = "abc";
        let s2: String = s.asSlice().asString();
        s2;
    }
}
