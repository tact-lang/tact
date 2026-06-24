struct Nested {
    a: Int;
    b: Bool?;
}

contract TestContract {
    foo: Nested;
    bar: Int;

    init() {
        self.foo = Nested{
            a: 42,
            b: true,
        };
        self.bar = 7;
    }
}