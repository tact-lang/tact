struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    c: Inner?;
    d: Bool;
}

contract NullableInner {
    f: Outer;

    init() {
        self.f = Outer{
            c: null,
            d: false
        };
    }
}