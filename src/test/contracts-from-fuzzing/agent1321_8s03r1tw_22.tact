struct Inner {
    foo: Int = 5;
    bar: Int;
}

struct Outer {
    nested: Inner;
    count: Int = 99;
}

contract NestedDefaults {
    store: Outer;
    init() {
        self.store = Outer{ nested: Inner{ foo: 42, bar: 10 }, count: 100 };
    }
}