struct Inner {
    a: Int
}

struct Middle {
    inner: Inner
}

struct Outer {
    middle: Middle
}

contract TestNested {
    receive() {
        let o = Outer{ middle: Middle{ inner: Inner{ a: 42 } } };
        dump(o.middle.inner.a);
    }
}
