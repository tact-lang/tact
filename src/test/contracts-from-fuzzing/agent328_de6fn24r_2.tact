struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    b: Int;
}

contract Test {
    foo: Outer;
    init() {
        self.foo = Outer{ inner: Inner{ a: 5 }, b: 10 };
    }
}