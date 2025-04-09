struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    p: Inner;
    c: Bool?;
    d: Int;
}

contract OptionalNest {
    state: Outer;

    init() {
        self.state = Outer{
            p: Inner{ a: 1, b: null },
            c: null,
            d: 42
        };
    }
}