struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    inner: Inner;
    value: Int;
}

fun sum_outer(o: Outer): Int {
    return o.inner.x + o.inner.y + o.value;
}

contract TestNestedStruct {
    receive() {
        let o: Outer = Outer{ inner: Inner{ x: 10, y: 20 }, value: 5 };
        sum_outer(o);
    }
}
