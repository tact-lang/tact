struct SBig {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

struct SBig2 {
    g: SBig;
    h: SBig;
    i: SBig;
}

contract BigNest {
    bigg: SBig2;

    init() {
        self.bigg = SBig2{
            g: SBig{a:1,b:2,c:3,d:4,e:5,f:6},
            h: SBig{a:7,b:8,c:9,d:10,e:11,f:12},
            i: SBig{a:13,b:14,c:15,d:16,e:17,f:18},
        };
    }
}