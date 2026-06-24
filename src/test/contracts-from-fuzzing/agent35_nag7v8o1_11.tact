struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNested {
    o: Outer = Outer { inner: Inner { a: 100 } };

    receive() {}

    get fun getOuter(): Outer {
        return self.o;
    }
}
