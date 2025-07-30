struct Inner {
    x: Int;
}

struct Middle {
    m: Inner;
}

struct Outer {
    o: Middle;
}

contract TestContract {
    out: Outer;
    init() {
        self.out = Outer{ o: Middle{ m: Inner{ x: 42 } } };
    }
}