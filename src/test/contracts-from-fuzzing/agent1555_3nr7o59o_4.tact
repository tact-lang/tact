struct DeeplyNested {
    n1: Int;
    n2: String?;
}

struct MiddleLayer {
    inside: DeeplyNested;
    note: String;
}

struct TopLayer {
    high: MiddleLayer;
    active: Bool?;
}

contract DeepNestingTest {
    bundle: TopLayer;

    init() {
        self.bundle = TopLayer{
            high: MiddleLayer{
                inside: DeeplyNested{
                    n1: 1000,
                    n2: null
                },
                note: "deep"
            },
            active: null
        };
    }

    receive(){}
}