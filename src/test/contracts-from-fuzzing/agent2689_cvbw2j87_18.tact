struct InnerInts {
    a: Int;
    b: Int;
    c: Int;
}

struct MidLevel {
    inner: InnerInts;
}

struct OuterMost {
    mid: MidLevel;
}

contract MultilevelIntegers {
    s: OuterMost;

    init() {
        self.s = OuterMost{
            mid: MidLevel{
                inner: InnerInts{
                    a: 11,
                    b: 22,
                    c: 33,
                },
            },
        };
    }
}