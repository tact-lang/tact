struct Inner {
    foo: Int;
}

struct Outer {
    bar: Inner;
    baz: Int?;
}

contract NestedStructOptional {
    s: Outer;

    init() {
        self.s = Outer{
            bar: Inner{foo: 3},
            baz: null,
        };
    }
}