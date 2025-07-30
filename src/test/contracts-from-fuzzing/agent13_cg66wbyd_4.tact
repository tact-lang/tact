struct Inner {
    foo: Int;
    nested: Nested;
}

struct Nested {
    bar: Int;
    baz: Bool;
}

contract Test {
    param: Inner;

    init() {
        self.param = Inner{
            foo: 10,
            nested: Nested{ bar: 42, baz: true }
        };
    }
}
