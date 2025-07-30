struct Inner {
    a: Int;
}

struct Outer1 {
    a: Int;
    inner: Inner;
}

struct Outer2 {
    b: Int;
    inner: Inner;
}

contract Test {
    s1: Outer1;
    s2: Outer2;

    init() {
        self.s1 = Outer1{ a:1, inner: Inner{ a:2 } };
        self.s2 = Outer2{ b:3, inner: Inner{ a:4 } };
    }
}
