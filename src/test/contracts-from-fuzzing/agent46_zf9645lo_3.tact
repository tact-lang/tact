struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    c: Int;
}

contract TestNestedStruct {
    receive() {
        let outer: Outer = Outer{
            inner: Inner{ a: 10, b: 20 },
            c: 30
        };
        let sum: Int = outer.inner.a + outer.inner.b + outer.c;
        sum;
    }
}
