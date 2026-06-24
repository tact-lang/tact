struct Nested {
    a: Int = 5;
    b: Bool = true;
}

contract NestedStorage {
    nested: Nested = Nested{};

    init() {
        self.nested = Nested{ a: 10, b: false };
    }
}