struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    nested: Inner;
    optionalNested: Inner?;
}

contract ComplexPersistent {
    state: Outer;

    init() {
        self.state = Outer{
            nested: Inner{ a: 10, b: null },
            optionalNested: null
        };
    }
}