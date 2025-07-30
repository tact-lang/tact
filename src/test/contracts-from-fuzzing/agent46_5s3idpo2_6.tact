struct InnerMost {
    foo: Int;
    bar: Int?;
}

struct Inner {
    nested: InnerMost;
    maybe: Int?;
}

struct Outer {
    a: Int;
    optInner: Inner?;
}

contract DeepOptionalComplex {
    state: Outer;

    init() {
        self.state = Outer{
            a: 1,
            optInner: Inner{
                nested: InnerMost{ foo: 10, bar: null },
                maybe: null
            }
        };
    }
}
