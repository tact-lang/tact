struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
}

contract TestNested {
    outer: Outer = Outer{
        inner: Inner{
            a: 10,
            b: true
        }
    };

    receive() {}

    get fun getOuter(): Outer {
        return self.outer;
    }
}
