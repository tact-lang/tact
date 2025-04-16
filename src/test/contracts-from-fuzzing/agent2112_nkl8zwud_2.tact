struct Inner {
    a: Int;
    b: Int;
    c: Int;
}

struct Outer {
    foo: Int;
    bar: Inner;
    baz: Int;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            foo: 1,
            bar: Inner{ a: 2, b: 3, c: 4 },
            baz: 5
        };
    }
}