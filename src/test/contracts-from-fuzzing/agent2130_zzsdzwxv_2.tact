struct Nested {
    x: Int = 1;
    y: Bool?;
}

contract Test {
    foo: Nested = Nested{};

    init() {
        self.foo = Nested{x: 7, y: true};
    }
}