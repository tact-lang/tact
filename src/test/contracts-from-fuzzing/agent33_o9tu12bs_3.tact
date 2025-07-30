struct Inner {
    f1: Int;
    f2: Int;
}

struct Outer {
    inner: Inner;
    other: Int;
}

contract TestNestedStructs {
    receive() {
        let o: Outer = Outer{
            inner: Inner{ f1: 100, f2: 200 },
            other: 300
        };
        let s: Int = o.inner.f1 + o.inner.f2 + o.other;
    }
}
