struct S {
    a: Int;
}

// Persistent optional Struct S
contract NestedOptional {
    s: S?;

    init() {
        self.s = null;
    }
}