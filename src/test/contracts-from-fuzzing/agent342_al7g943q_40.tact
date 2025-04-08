struct InnerS {
    a: Int;
}

struct MidS {
    i1: InnerS;
    i2: InnerS;
}

struct OuterS {
    m: MidS;
}

contract ExpandedNesting {
    v: OuterS;

    init() {
        self.v = OuterS{
            m: MidS{
                i1: InnerS{a:1},
                i2: InnerS{a:2}
            }
        };
    }
}
