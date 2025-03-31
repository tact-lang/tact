struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    extra: Int;
}

contract Test7 {
    o: Outer;

    init() {
        self.o = Outer{ inner: Inner{ a: 5, b: false }, extra: 10 };
    }

    receive() {}

    get fun getOuter(): Outer {
        return self.o;
    }
}
