struct InnerMost {
    val: Int;
}

struct MidLevel {
    a: InnerMost;
    b: InnerMost;
}

struct TopLevel {
    m1: MidLevel;
    m2: MidLevel;
    opt: MidLevel?;
}

contract NestedStructsVariant {
    top: TopLevel;

    init() {
        self.top = TopLevel{
            m1: MidLevel{ a: InnerMost{ val:1 }, b: InnerMost{ val:2 } },
            m2: MidLevel{ a: InnerMost{ val:3 }, b: InnerMost{ val:4 } },
            opt: null
        };
    }
}
