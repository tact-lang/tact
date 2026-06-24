struct Inner {
    i: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestNested {
    o: Outer;

    init() {
        self.o = Outer{ inner: Inner{ i: 777 }, flag: true };
    }

    receive() {}

    get fun getOuter(): Outer {
        return self.o;
    }
}
