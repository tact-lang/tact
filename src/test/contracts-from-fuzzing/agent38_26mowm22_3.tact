struct DeepNested {
    n1: Int;
    n2: Bool;
}

struct MiddleNested {
    d1: DeepNested;
    d2: Int;
}

struct TopNested {
    m1: MiddleNested;
    m2: String;
}

contract TestContract {
    t: TopNested;
    init() {
        self.t = TopNested{
            m1: MiddleNested{
                d1: DeepNested{
                    n1: 1,
                    n2: false
                },
                d2: 2
            },
            m2: "deep"
        };
    }
}
