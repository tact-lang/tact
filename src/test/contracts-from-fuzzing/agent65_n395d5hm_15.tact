struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    b: Int;
}

contract TestNestedGetter {
    inner: Inner = Inner{ a: 50 };
    b: Int = 100;

    receive() {}

    // Getter returning a nested struct
    get fun getOuter(): Outer {
        return Outer{
            inner: self.inner,
            b: self.b
        };
    }
}
