struct InnerMost {
    x: Int;
    y: Bool;
}

struct Mid {
    a: InnerMost;
    b: InnerMost;
}

struct Outer {
    m1: Mid;
    m2: Mid;
}

contract WideDeepStruct {
    s: Outer;

    init() {
        self.s = Outer{
            m1: Mid{
                a: InnerMost{x:1,y:true},
                b: InnerMost{x:2,y:false}
            },
            m2: Mid{
                a: InnerMost{x:3,y:true},
                b: InnerMost{x:4,y:false}
            }
        };
    }
}