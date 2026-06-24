struct InnerMost {
    z1: Int;
    z2: Int?;
}

struct Inner {
    y: InnerMost;
    yopt: InnerMost?;
}

struct Outer {
    x: Inner;
    xopt: Inner?;
    simple: Int;
}

contract DeeplyNestedStructs {
    nestedData: Outer;

    init() {
        self.nestedData = Outer{
            x: Inner{
                y: InnerMost{ z1: 1, z2: null },
                yopt: null
            },
            xopt: null,
            simple: 100
        };
    }
}