struct Inner {
    a: Int;
    b: String?;
    c: Bool;
}

struct Outer {
    inner: Inner;
    d: Bool?;
    e: Int;
}

contract Test {
    s: Outer;

    init() {
        self.s = Outer{
            inner: Inner{ a: 1, b: null, c: true },
            d: false,
            e: 42,
        };
    }
}