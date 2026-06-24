struct Nested {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract Test3 {
    data: Nested;

    init() {
        self.data = Nested{
            inner1: Inner{ x: 1, y: 2 },
            inner2: Inner{ x: 3, y: 4 },
        };
    }
}