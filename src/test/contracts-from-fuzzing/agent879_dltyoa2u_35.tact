struct InnerMost {
    x: Int;
}

struct MidLevel {
    a: InnerMost;
    b: InnerMost;
}

struct TopLevel {
    left: MidLevel;
    right: MidLevel;
}

contract WideNestedStruct {
    s: TopLevel;
    init() {
        self.s = TopLevel{
            left: MidLevel{
                a: InnerMost{ x: 1 },
                b: InnerMost{ x: 2 }
            },
            right: MidLevel{
                a: InnerMost{ x: 3 },
                b: InnerMost{ x: 4 }
            }
        };
    }
}
