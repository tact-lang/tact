struct Inner {
    foo: Int?;
}

struct Outer {
    bar: Inner?;
}

contract LayeredOptionals {
    s: Outer = Outer { bar: null };

    init() {
        self.s = Outer { bar: Inner{ foo: 123 } };
    }

    receive() {}
}