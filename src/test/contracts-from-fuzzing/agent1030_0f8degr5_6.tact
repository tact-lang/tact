struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract DoubleStructTest {
    os: Outer;

    init() {
        self.os = Outer{
            inner1: Inner{a: 1, b: true},
            inner2: Inner{a: 2, b: false},
        };
    }
}