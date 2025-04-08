struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    c: Inner;
    d: Int;
}

contract Test3 {
    storage: Outer;

    init() {
        self.storage = Outer{
            c: Inner{ a: 1, b: true },
            d: 2,
        };
    }
}