struct LeafInner {
    flag: Bool;
}

struct MiddleNest {
    inner: LeafInner;
}

struct TopMost {
    nested: MiddleNest;
}

contract FlagNest {
    s: TopMost;

    init() {
        self.s = TopMost {
            nested: MiddleNest {
                inner: LeafInner {
                    flag: true
                }
            }
        };
    }
}