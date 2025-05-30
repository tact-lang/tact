struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestNested {
    outer: Outer = Outer{ inner: null };

    receive() {}

    get fun getOptionalInner(): Inner? {
        return self.outer.inner;
    }
}
