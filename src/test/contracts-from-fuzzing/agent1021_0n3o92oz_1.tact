struct Nested {
    inner: Int = 10;
}

contract ComplexStorage {
    nested: Nested;

    init() {
        self.nested = Nested{};
    }
}