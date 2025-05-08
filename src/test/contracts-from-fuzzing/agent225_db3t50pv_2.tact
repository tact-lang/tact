struct Nested {
    x: Int;
}

contract HasNested {
    n: Nested;

    init() {
        self.n = Nested{ x: 10 };
    }
}