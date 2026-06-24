struct SInner {
    a: Int;
}

struct SMid {
    i1: SInner;
    i2: SInner;
}

struct SOut {
    m1: SMid;
    m2: SMid;
}

contract WideDeepNesting {
    data: SOut;

    init() {
        self.data = SOut{
            m1: SMid{
                i1: SInner{ a:1 },
                i2: SInner{ a:2 }
            },
            m2: SMid{
                i1: SInner{ a:3 },
                i2: SInner{ a:4 }
            }
        };
    }
}