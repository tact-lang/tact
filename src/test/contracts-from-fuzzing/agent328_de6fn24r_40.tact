struct Inner {
    a: Int = 1;
    b: Int;
}

struct Outer {
    inner: Inner;
}

contract Test {
    s: Outer;
    init() {
        self.s = Outer{ inner: Inner{ b:5 } };
    }
}