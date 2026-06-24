struct Inner {
    a: Int;
    b: Int
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    extra: Int
}

fun test(o: Outer): Int {
    return o.inner1.a + o.inner1.b + o.inner2.a + o.inner2.b + o.extra;
}

contract TestNestedStruct {
    receive() {
        let inner: Inner = Inner{ a: 1, b: 2 };
        let o: Outer = Outer{ inner1: inner, inner2: inner, extra: 3 };
        test(o);
    }
}
