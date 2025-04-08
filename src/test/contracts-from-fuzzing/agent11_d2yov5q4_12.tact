struct InnerMost {
    a: Int;
    b: Int;
}

struct MidLevel {
    m1: InnerMost;
    m2: InnerMost;
}

struct OuterLevel {
    o1: MidLevel;
    o2: MidLevel;
}

contract DoubleNestedStructs {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{
            o1: MidLevel{
                m1: InnerMost{ a: 1, b: 2 },
                m2: InnerMost{ a: 3, b: 4 },
            },
            o2: MidLevel{
                m1: InnerMost{ a: 5, b: 6 },
                m2: InnerMost{ a: 7, b: 8 },
            },
        };
    }
}