struct Inner {
    i: Int as uint8;
}

struct Outer {
    inner: Inner;
    sum: Int as uint8;
}

contract TestNested {
    receive() {
        let x = Outer {
            inner: Inner { i: 10 },
            sum: 20
        };
        dump(x.inner.i + x.sum);
    }
}
