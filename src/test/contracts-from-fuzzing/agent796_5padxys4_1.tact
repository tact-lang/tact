struct Nested {
    a: Int;
    b: Int?;
    c: Inner;
}

struct Inner {
    x: Int;
}

contract Test {
    data: Nested;
    init() {
        self.data = Nested{ a:1, b: null, c: Inner{ x:2 } };
    }
}