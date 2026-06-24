struct DeepNest {
    s1: String;
    s2: Int?;
}

struct MidNest {
    d1: DeepNest;
    d2: Int;
}

struct OuterMost {
    mid: MidNest;
    b: Bool;
}

contract DeeplyNested {
    data: OuterMost;

    init() {
        self.data = OuterMost {
            mid: MidNest {
                d1: DeepNest { s1: "hi", s2: null },
                d2: 5
            },
            b: false,
        };
    }
}
