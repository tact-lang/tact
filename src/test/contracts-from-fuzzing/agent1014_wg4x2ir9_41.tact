struct Nested {
    inn: Inner;
}

struct Inner {
    x: Int;
}

contract Test {
    n: Nested;

    init() {
        self.n = Nested{ inn: Inner{ x: 42 } };
    }
}
