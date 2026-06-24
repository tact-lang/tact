struct InnerMost {
    a: Int; b: Int; c: Int;
}

struct Middle {
    m1: InnerMost;
    m2: InnerMost;
    m3: InnerMost;
}

struct Outer {
    o1: Middle;
    o2: Middle;
}

contract DeepWide {
    state: Outer = Outer{
        o1: Middle{
            m1: InnerMost{a:1,b:2,c:3},
            m2: InnerMost{a:4,b:5,c:6},
            m3: InnerMost{a:7,b:8,c:9}
        },
        o2: Middle{
            m1: InnerMost{a:10,b:11,c:12},
            m2: InnerMost{a:13,b:14,c:15},
            m3: InnerMost{a:16,b:17,c:18}
        }
    };
}