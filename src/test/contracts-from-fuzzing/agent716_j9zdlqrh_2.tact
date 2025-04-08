struct Inner {
    level: Int;
}

struct Middle {
    i: Inner;
}

struct Outer {
    m: Middle;
}

contract NestedStructTest {
    s: Outer;

    init() {
        self.s = Outer{ m: Middle{ i: Inner{ level: 1 } } };
    }
}