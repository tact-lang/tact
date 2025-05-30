struct InnerMost {
    val: Int;
}

struct L2 {
    i1: InnerMost;
    i2: InnerMost;
}

struct L1 {
    a: L2;
    b: L2;
}

contract MultiNested {
    s: L1;

    init() {
        self.s = L1{
            a: L2 {
                i1: InnerMost{ val: 1 },
                i2: InnerMost{ val: 2 },
            },
            b: L2 {
                i1: InnerMost{ val: 3 },
                i2: InnerMost{ val: 4 },
            },
        };
    }
}