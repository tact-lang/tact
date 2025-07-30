struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    inner: Inner;
    optInner: Inner?;
}

contract TestComplex {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{foo: 1, bar: true},
            optInner: null
        };
    }
}