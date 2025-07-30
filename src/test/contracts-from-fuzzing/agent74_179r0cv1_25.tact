struct Inner {
    flag: Bool;
    tiny: Int as uint1;
}

struct Outer {
    nested: Inner;
    more: Int as int2;
}

contract TestContract {
    foo: Outer;

    init() {
        self.foo = Outer{ nested: Inner{ flag: true, tiny: 1 }, more: -1 };
    }
}