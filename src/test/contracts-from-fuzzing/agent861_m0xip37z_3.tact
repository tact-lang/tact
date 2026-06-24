struct Inner {
    foo: Int;
}

struct Outer {
    nested: Inner;
    bar: Bool;
}

contract NestedStructs {
    st: Outer;

    init() {
        self.st = Outer{
            nested: Inner{ foo: 10 },
            bar: true,
        };
    }
}
