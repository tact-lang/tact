struct DeepLevel {
    a: Int;
    b: Int?;
}

struct MidLevel {
    m1: Bool;
    m2: DeepLevel;
}

struct TopLevel {
    t1: Int;
    t2: MidLevel;
}

contract TestContract {
    complex: TopLevel;

    init() {
        self.complex = TopLevel{
            t1: 42,
            t2: MidLevel{
                m1: true,
                m2: DeepLevel{a: 7, b: null},
            },
        };
    }
}