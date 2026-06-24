struct Nested {
    foo: Int = 7;
    bar: Bool?;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{};
    }
}