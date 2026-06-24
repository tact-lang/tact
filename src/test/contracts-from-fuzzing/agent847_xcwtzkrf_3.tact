struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    a: Inner;
    b: Bool;
    c: Int?;
}

contract NestedOptionals {
    s: Outer;

    init() {
        self.s = Outer{
            a: Inner{ foo: 7, bar: true },
            b: false,
            c: null
        };
    }
}