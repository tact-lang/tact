struct S {
    s: String;
}

contract Test {
    receive() {
        // Test: Struct with a string field; instantiate using struct literal syntax
        let instance: S = S { s: "Test from struct" };
        dump(instance.s);
    }
}
