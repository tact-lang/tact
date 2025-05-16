struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    c: Int;
    d: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{ a: 1, b: true },
            c: 2,
            d: false,
        };
    }
}