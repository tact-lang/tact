struct Nested {
    inner: Int;
}

contract NestedStruct {
    nested: Nested;

    init() {
        self.nested = Nested{ inner: 10 };
    }
}