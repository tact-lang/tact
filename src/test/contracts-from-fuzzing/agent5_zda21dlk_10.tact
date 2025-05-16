struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestNested {
    outer: Outer = Outer { inner: null };

    receive() {}

    get fun get_outer(): Outer {
        return self.outer;
    }
}
