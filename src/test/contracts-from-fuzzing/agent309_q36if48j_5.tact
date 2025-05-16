struct DeepOptional {
    d1: Int?;
    d2: Int?;
}

struct MidOptional {
    m1: Bool?;
    m2: DeepOptional?;
}

struct TopLayer {
    t1: MidOptional?;
    t2: Bool;
}

contract OptionalNestedLayers {
    s: TopLayer;

    init() {
        self.s = TopLayer{
            t1: null,
            t2: true,
        };
    }
}