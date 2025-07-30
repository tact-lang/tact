struct InnerMost {
    val: Int;
}

struct MiddleLayer {
    a: InnerMost;
    b: InnerMost?;
}

struct OuterLayer {
    part: MiddleLayer;
    another: MiddleLayer?;
}

contract ComplexNested {
    nested: OuterLayer;

    init() {
        self.nested = OuterLayer{
            part: MiddleLayer{
                a: InnerMost{ val: 7 },
                b: null
            },
            another: null
        };
    }
}
