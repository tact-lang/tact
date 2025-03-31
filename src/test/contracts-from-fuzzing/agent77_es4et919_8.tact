struct Inner {
    v: Int;
}

struct Outer {
    inner: Inner;
}

contract NestedGetter {
    state: Outer;

    init() {
        self.state = Outer { inner: Inner { v: 999 } };
    }

    receive() {}

    get fun getNested(): Outer {
        return self.state;
    }
}
