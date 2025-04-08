struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: Nested;
    foo: Int;
    bar: Bool;

    init() {
        self.nested = Nested{ a: 5, b: true };
        self.foo = 10;
        self.bar = false;
    }
}