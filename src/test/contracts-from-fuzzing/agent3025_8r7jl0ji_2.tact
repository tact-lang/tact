struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            a: 10,
            b: true,
        };
    }
}