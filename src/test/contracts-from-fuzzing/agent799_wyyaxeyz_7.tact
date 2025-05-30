struct Small {
    a: Int;
    b: Int;
}

struct Medium {
    s1: Small;
    s2: Small;
}

struct Big {
    m1: Medium;
    m2: Medium;
    m3: Medium;
}

contract WidthDepth {
    info: Big;
    init() {
        self.info = Big {
            m1: Medium{ s1: Small{a:1,b:2}, s2: Small{a:3,b:4} },
            m2: Medium{ s1: Small{a:5,b:6}, s2: Small{a:7,b:8} },
            m3: Medium{ s1: Small{a:9,b:10}, s2: Small{a:11,b:12} }
        };
    }
}