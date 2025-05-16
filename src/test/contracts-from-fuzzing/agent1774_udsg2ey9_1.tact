struct Nested {
    a: Int;
    b: Bool;
}

contract Test {
    nested: Nested;

    init() {
        self.nested = Nested{
            a: 0,
            b: false,
        };
    }
}