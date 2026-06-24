struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestNested {
    o: Outer;

    init() {
        self.o = Outer { inner: Inner { x: 97 }, flag: true };
    }

    receive() {}

    get fun getOuter(): Outer {
        return self.o;
    }
}
