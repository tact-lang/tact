struct Nested {
    inner1: InnerNested;
    inner2: InnerNested;
}

struct InnerNested {
    x: Int;
    y: String;
}

contract DoubleNest {
    n: Nested;

    init() {
        self.n = Nested{
            inner1: InnerNested{ x: 1, y: "X" },
            inner2: InnerNested{ x: 2, y: "Y" },
        };
    }
}
