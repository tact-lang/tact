contract Test {
    // Persistent state variable: a string with an escape sequence
    a: String = "State string with escape \n in it";

    receive() {
        // Ensure that a state string, when converted to a slice and back, remains valid
        let s: String = self.a;
        let s2: String = s.asSlice().asString();
    }
}
