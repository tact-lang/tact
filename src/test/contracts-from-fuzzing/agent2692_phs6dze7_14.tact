struct Inner {
    x: Int;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Int;
}

struct WithInner {
    inner: Outer;
    d: Int;
}

contract MultiNested {
    val: WithInner;

    init() {
        self.val = WithInner{
            inner: Outer{ a: 1, b: Inner{ x: 2 }, c: 3 },
            d: 4
        };
    }
}
