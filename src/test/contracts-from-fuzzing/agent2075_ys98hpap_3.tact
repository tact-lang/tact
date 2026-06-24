struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    c: Int;
}

struct Outer {
    middle: Middle;
    d: Bool;
}

contract DeepNesting {
    store: Outer;

    init() {
        self.store = Outer{
            middle: Middle{
                inner: Inner{ a: 1, b: false },
                c: 2
            },
            d: true
        };
    }
}