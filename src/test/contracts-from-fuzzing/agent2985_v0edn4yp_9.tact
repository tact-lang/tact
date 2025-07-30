struct InnerMost {
    val: Int;
}

struct MidLvl {
    in1: InnerMost;
    in2: InnerMost;
}

struct Outer {
    m1: MidLvl;
    m2: MidLvl;
}

contract MultiNested {
    data: Outer;
    
    init() {
        self.data = Outer{
            m1: MidLvl{
                in1: InnerMost{ val:1 },
                in2: InnerMost{ val:2 }
            },
            m2: MidLvl{
                in1: InnerMost{ val:3 },
                in2: InnerMost{ val:4 }
            }
        };
    }
}
