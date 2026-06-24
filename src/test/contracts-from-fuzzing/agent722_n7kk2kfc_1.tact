struct Nested {
    a: Int;
    b: Bool;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            a: 42,
            b: true,
        };
    }
}