struct DeepNested {
    d1: Bool;
    d2: Int;
}

struct MidNested {
    m1: Int;
    m2: DeepNested;
}

struct TopLevel {
    t1: Bool;
    t2: MidNested;
}

contract TestContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            t1: false,
            t2: MidNested{
                m1: 9,
                m2: DeepNested{
                    d1: true,
                    d2: 42,
                },
            },
        };
    }
}