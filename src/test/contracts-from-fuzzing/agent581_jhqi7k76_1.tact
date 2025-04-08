struct Nested {
    point: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{ point: Inner{ x: 1, y: 2 } };
    }
}
