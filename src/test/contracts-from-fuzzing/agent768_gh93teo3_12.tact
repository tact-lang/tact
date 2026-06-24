struct Inner {
    a: Int;
    b: String;
}

struct Outer1 {
    in1: Inner;
}

struct Outer2 {
    in2: Inner;
}

struct Container {
    o1: Outer1;
    o2: Outer2;
}

contract DoubleNest {
    big: Container;

    init() {
        self.big = Container {
            o1: Outer1 { in1: Inner { a: 1, b: "b1"}},
            o2: Outer2 { in2: Inner { a: 2, b: "b2"}}
        };
    }
}