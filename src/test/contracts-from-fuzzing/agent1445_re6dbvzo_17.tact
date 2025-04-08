struct OuterMost {
    l1: Int;
    middle: MiddleNested;
}

struct MiddleNested {
    l2: Int;
    innerMost: InnerNested;
}

struct InnerNested {
    l3: Int;
    str: String;
}

contract TripleLayerNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            l1: 1,
            middle: MiddleNested{
                l2: 2,
                innerMost: InnerNested{
                    l3: 3,
                    str: "deepest",
                },
            },
        };
    }
}