struct Nested {
    x: Int;
    y: Bool;
}

contract Test {
    foo: Int = 10;
    bar: Nested = Nested{x: 1, y: true};

    init() {
        self.foo = 20;
        self.bar = Nested{x: 2, y: false};
    }
}