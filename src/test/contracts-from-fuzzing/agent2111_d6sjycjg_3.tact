struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner{ foo: 1, bar: true },
            nested2: Inner{ foo: 2, bar: false }
        };
    }
}