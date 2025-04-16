struct InnerMost {
    p: Int;
}

struct MidLevel {
    q: InnerMost;
    r: Int;
}

struct TopLevel {
    s: Int;
    t: MidLevel;
    u: Bool;
}

contract DeepAssign {
    val: TopLevel;
    init() {
        self.val = TopLevel{
            s: 10,
            t: MidLevel{
                q: InnerMost{p: 20},
                r: 30
            },
            u: false
        };
    }
}