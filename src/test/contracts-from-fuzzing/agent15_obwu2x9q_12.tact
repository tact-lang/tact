struct Outer {
    a: Int;
    nested: Middle;
}

struct Middle {
    b: Bool;
    deepest: InnerMost;
}

struct InnerMost {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract ComplexDeepStruct {
    s: Outer;

    init() {
        self.s = Outer{
            a: 11,
            nested: Middle{
                b: true,
                deepest: InnerMost{
                    x: 7,
                    y: null,
                    z: null,
                },
            },
        };
    }
}