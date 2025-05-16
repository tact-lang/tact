struct DeepNested {
    d1: Int;
    d2: String;
}

struct MidNested {
    m1: Bool;
    m2: DeepNested;
}

struct TopNested {
    t1: Int;
    t2: MidNested;
}

contract Test4 {
    val: TopNested;

    init() {
        self.val = TopNested{
            t1: 33,
            t2: MidNested{
                m1: true,
                m2: DeepNested{
                    d1: 44,
                    d2: "deep"
                }
            }
        };
    }
}