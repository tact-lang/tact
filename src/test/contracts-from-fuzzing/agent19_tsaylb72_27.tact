struct InnerMost {
    flag: Bool;
}

struct MiddleLevel {
    inner: InnerMost;
}

struct OuterLevel {
    mid: MiddleLevel;
}

contract TripleLayerPersistent {
    outer: OuterLevel;

    init() {
        self.outer = OuterLevel{
            mid: MiddleLevel{
                inner: InnerMost{
                    flag: true
                }
            }
        };
    }
}
