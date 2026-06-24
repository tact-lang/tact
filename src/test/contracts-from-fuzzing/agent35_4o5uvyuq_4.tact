struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    x: Int;
}

fun sum_outer(o: Outer): Int {
    return o.inner.a + o.inner.b + o.x;
}

contract TestContract {
    receive() {
        let o: Outer = Outer{ inner: Inner{a: 10, b: 20}, x: 5 };
        let s = sum_outer(o);
    }
}
