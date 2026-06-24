struct Inner {
    a: Int;
}

struct Outer {
    s: Inner;
    b: Int;
}

contract Test {
    o: Outer;

    init() {
        self.o = Outer{ s: Inner{ a: 2 }, b: 3 };
    }
}