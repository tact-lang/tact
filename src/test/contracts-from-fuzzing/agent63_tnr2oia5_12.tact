struct MyStruct {
    s: String;
}

contract Test {
    receive() {
        // Testing usage of strings in a struct and their methods
        let m: MyStruct = MyStruct { s: "Hello, Struct" };
        let h: Int = m.s.hashData();
        // Also converting string to slice and back demonstrates round-trip conversion
        let r: String = m.s.asSlice().asString();
        if (m.s == r) {
            // Do nothing, just confirming equality
        }
    }
}
