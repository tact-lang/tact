struct Nested {
    point: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract Test {
    nested: Nested;

    init() {
        self.nested = Nested{
            point: Inner{ x: 1, y: 2 }
        };
    }
}
