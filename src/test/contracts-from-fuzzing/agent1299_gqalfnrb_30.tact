struct InnerMost {
    a: Int;
}

struct InnerMid {
    x: InnerMost;
    y: InnerMost;
}

struct OuterMost {
    mid: InnerMid;
}

contract DeepNestMid {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            mid: InnerMid{
                x: InnerMost{ a:1 },
                y: InnerMost{ a:2 }
            }
        };
    }
}