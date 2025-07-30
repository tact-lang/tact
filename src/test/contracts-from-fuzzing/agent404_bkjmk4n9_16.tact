struct InnerMost {
    a: Int;
}

struct MidLevel {
    x: Int; 
    inner: InnerMost;
    optInner: InnerMost?;
}

struct HighLevel {
    mid: MidLevel;
    optMid: MidLevel?;
}

contract NestedStructs {
    data: HighLevel;
    init() {
        self.data = HighLevel{
            mid: MidLevel{
                x: 1,
                inner: InnerMost{a: 2},
                optInner: null
            },
            optMid: null
        };
    }
}