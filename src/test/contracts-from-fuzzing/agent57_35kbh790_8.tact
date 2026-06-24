struct Inner {
    x: Int;
}

struct Outer {
    i: Inner;
    flag: Bool;
}

contract TestGetterNested {
    o: Outer;

    init() {
        self.o = Outer { i: Inner { x: 123 }, flag: false };
    }

    receive() {}

    get fun getOuter(): Outer {
        return self.o;
    }
}
