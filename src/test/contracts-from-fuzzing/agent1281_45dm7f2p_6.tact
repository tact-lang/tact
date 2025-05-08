struct InnerMost {
    val: Int;
}

struct WithArrayFields {
    a: InnerMost;
    b: InnerMost;
    c: InnerMost;
    d: InnerMost;
    e: InnerMost;
    f: InnerMost;
    g: InnerMost;
    h: InnerMost;
    i: InnerMost;
    j: InnerMost;
}

contract BigNestedStruct {
    data: WithArrayFields;

    init() {
        self.data = WithArrayFields{
            a: InnerMost{val:1},
            b: InnerMost{val:2},
            c: InnerMost{val:3},
            d: InnerMost{val:4},
            e: InnerMost{val:5},
            f: InnerMost{val:6},
            g: InnerMost{val:7},
            h: InnerMost{val:8},
            i: InnerMost{val:9},
            j: InnerMost{val:10},
        };
    }
}