struct Outer {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int;
    d: Bool;
}

contract NestedOrder {
    nested: Outer;

    init() {
        self.nested = Outer{
            a: 100,
            b: Inner{c: 200, d: true}
        };
    }
}