struct InnerMost {
    val: Int;
}

struct MiddleS {
    a: InnerMost;
    b: Bool;
}

struct OuterS {
    m: MiddleS;
    name: String;
}

contract MultiNestMix {
    outer: OuterS;

    init() {
        self.outer = OuterS{
            m: MiddleS{
                a: InnerMost{val: 17},
                b: true
            },
            name: "layer"
        };
    }
}