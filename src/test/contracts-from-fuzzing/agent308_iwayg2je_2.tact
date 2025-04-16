struct Inner {
    foo: Int;
}

struct Middle {
    bar: Inner;
}

struct Outer {
    baz: Middle;
}

contract NestedStructs {
    nested: Outer;

    init() {
        self.nested = Outer{baz: Middle{bar: Inner{foo: 1}}};
    }
}