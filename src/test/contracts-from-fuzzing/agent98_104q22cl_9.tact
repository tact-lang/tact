contract Test {
    receive() {
        // Test conversion of a string to slice and back to string using asSlice and asString
        let orig: String = "Hello, Tact!";
        let repr: String = orig.asSlice().asString();
        let equal: Bool = (orig == repr);
    }
}
