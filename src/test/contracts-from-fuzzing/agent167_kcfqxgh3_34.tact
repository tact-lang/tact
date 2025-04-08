struct InnerMost {
    leaf: Int = 42;
}

struct DeepNest {
    n1: InnerMost;
    n2: InnerMost;
    n3: InnerMost;
    n4: InnerMost;
    n5: InnerMost;
}

contract ManyDeepStructs {
    s: DeepNest;

    init() {
        self.s = DeepNest{
            n1: InnerMost{leaf:1},
            n2: InnerMost{leaf:2},
            n3: InnerMost{leaf:3},
            n4: InnerMost{leaf:4},
            n5: InnerMost{leaf:5}
        };
    }
}