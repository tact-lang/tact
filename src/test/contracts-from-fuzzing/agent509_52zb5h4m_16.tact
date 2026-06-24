struct Inner {
    foo: Int;
}

struct Outer {
    bar: Int;
    nested: Inner;
}

contract DefaultsNested {
    p: Outer;

    init() {
        self.p = Outer{
            bar: 99,
            nested: Inner{foo: 42}
        };
    }
}