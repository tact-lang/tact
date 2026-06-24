struct Nested {
    x: Int;
    y: Bool;
}

contract TestContract {
    n: Nested;

    init() {
        self.n = Nested{
            x: 42,
            y: true,
        };
    }
}