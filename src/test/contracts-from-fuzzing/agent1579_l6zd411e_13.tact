struct BigNested {
    s1: String;
    s2: String;
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract ComplexNested {
    big: BigNested;

    init() {
        self.big = BigNested{
            s1: "foo",
            s2: "bar",
            inner: Inner{ x: 42, y: true }
        };
    }

    receive() {
        self.big.inner.x += 1;
    }
}