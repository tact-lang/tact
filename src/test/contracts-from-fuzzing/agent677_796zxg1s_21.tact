struct Inner {
    a: Int = 5;
    b: Int = 6;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract Test {
    o: Outer;

    init() {
        self.o = Outer{ x:1, y: Inner{ a:42 } };
    }
}