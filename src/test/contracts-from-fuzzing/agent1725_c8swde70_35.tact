struct OutMost {
    s1: String?;
    s2: String?;
}

struct MidMost {
    out1: OutMost;
    out2: OutMost;
}

contract NestedOptionPack {
    mid: MidMost;

    init() {
        self.mid = MidMost{
            out1: OutMost{ s1:null, s2:null },
            out2: OutMost{ s1:null, s2:null }
        };
    }
}