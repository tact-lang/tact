struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    y: Int;
}

fun make_outer() : Outer {
    return Outer{
        inner: Inner { x: 123 },
        y: 456
    };
}

contract TestNested {
    receive() {
        let o = make_outer();
        dump(o.inner.x + o.y);
    }
}
