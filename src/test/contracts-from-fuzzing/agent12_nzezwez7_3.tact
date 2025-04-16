struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    y: Int = 10;
}

fun main(): Int {
    let o = Outer{ inner: Inner{ x: 20 } };
    return o.inner.x + o.y;
}
