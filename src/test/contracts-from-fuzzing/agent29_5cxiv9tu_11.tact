struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract Test {
    outer: Outer = Outer { inner: Inner { a: 10 } };

    get fun getNested(): Outer {
        // Modify state inside getter (expected behavior: modifications do not persist)
        self.outer.inner.a += 1;
        return self.outer;
    }

    receive() {
        self.getNested();
    }
}
