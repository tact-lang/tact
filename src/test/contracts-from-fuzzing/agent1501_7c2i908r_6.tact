struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    mid: Middle;
}

contract TestContract {
    foo: Outer;

    init() {
        self.foo = Outer{ mid: Middle{ inner: Inner{ a: 999 } } };
    }
}