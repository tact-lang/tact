struct Outer {
    a: Int;
    b: Bool;
    nested: Inner;
}

struct Inner {
    c: Int;
    d: String?;
}

contract NestedMiddleOptional {
    data: Outer;

    init() {
        self.data = Outer{
            a: 10,
            b: true,
            nested: Inner{ c: 5, d: null }
        };
    }
}
