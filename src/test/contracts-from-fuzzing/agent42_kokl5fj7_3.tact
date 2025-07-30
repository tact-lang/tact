struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    extra: Int;
}

fun test_nested(o: Outer): Int {
    return o.inner.a + o.inner.b + o.extra;
}

contract TestContractNested {
    receive() {
        let o: Outer = Outer { inner: Inner { a: 10, b: 20 }, extra: 30 };
        test_nested(o);
    }
}
