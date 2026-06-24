// Contract with deeply nested optional fields and serialization constraints
struct Low {
    a: Int as uint8;
    b: Bool?;
}

struct MidOpt {
    level: Low?;
}

struct TopMost {
    mid1: MidOpt;
    mid2: MidOpt;
}

contract NestedOptSerial {
    data: TopMost;

    init() {
        self.data = TopMost{
            mid1: MidOpt{ level: null },
            mid2: MidOpt{ level: null },
        };
    }
}
