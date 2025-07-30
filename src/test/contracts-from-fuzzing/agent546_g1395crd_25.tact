struct InnerMost {
    x: Int;
}

struct MidLevel {
    i1: InnerMost;
    i2: InnerMost?;
}

struct OuterLevel {
    m1: MidLevel;
    m2: MidLevel?;
}

contract DeeplyNestedOpts {
    o: OuterLevel;

    init() {
        self.o = OuterLevel{
            m1: MidLevel{ i1: InnerMost{ x:1 }, i2:null },
            m2: null
        };
    }
}