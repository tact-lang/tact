struct Inner {
    f1: Int;
}

struct Outer {
    stuff: Inner;
}

contract ModAfterAssign {
    foo: Outer = Outer{stuff: Inner{f1: 42}};

    init() {
        let old = self.foo;
        self.foo = Outer{stuff: Inner{f1: 100}};
        let _ = old.stuff.f1;
    }
}