struct InnerMost {
    x: Int;
    y: Bool;
}

struct MidLevel {
    m1: InnerMost;
    m2: InnerMost;
}

struct TopLevel {
    t1: MidLevel;
    t2: MidLevel;
}

contract TestContract {
    nested: TopLevel;

    init() {
        self.nested = TopLevel{
            t1: MidLevel{
                m1: InnerMost{x:1,y:true},
                m2: InnerMost{x:2,y:false}
            },
            t2: MidLevel{
                m1: InnerMost{x:3,y:true},
                m2: InnerMost{x:4,y:false}
            }
        };
    }
}