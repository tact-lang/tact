struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    c: Int;
}

contract DeepNest {
    obj: Outer;

    init() {
        self.obj = Outer{
            inner: Inner{ a: 1, b:2 },
            c: 3,
        };
    }
}