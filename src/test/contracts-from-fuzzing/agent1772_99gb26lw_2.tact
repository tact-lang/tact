struct Nested {
    x: Int;
    y: Bool;
}

contract Test2 {
    s: Nested;

    init() {
        self.s = Nested{
            x: 42,
            y: true,
        };
    }
}