struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract TestGetterNested {
    outer: Outer;

    init() {
        self.outer = Outer { inner: Inner { a: 999 } };
    }

    receive() {}

    get fun getOuter(): Outer {
        return self.outer;
    }
}
