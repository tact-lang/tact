struct Inner {
    a: Int;
}

struct Outer {
    x: Int;
    y: Int;
    s1: Inner;
    s2: Inner;
}

contract Test {
    o: Outer;

    init() {
        self.o = Outer{
            x: 1,
            y: 2,
            s1: Inner{ a: 3 },
            s2: Inner{ a: 4 }
        };
    }
}