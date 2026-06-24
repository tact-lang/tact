struct S {
    field: String = "default\nvalue";
}

contract Test {
    receive() {
        // Test using a struct that has a default string field with escape sequences
        let s: S = S{};
        dump(s.field);
    }
}
