struct InnerMost {
    m: Int;
    text: String;
}

struct Med {
    i1: InnerMost;
    i2: InnerMost;
}

struct OuterMost {
    m1: Med;
    m2: Med;
}

contract BigNested {
    d: OuterMost;

    init() {
        self.d = OuterMost{
            m1: Med{
                i1: InnerMost{m:1,text:"a"},
                i2: InnerMost{m:2,text:"b"}
            },
            m2: Med{
                i1: InnerMost{m:3,text:"c"},
                i2: InnerMost{m:4,text:"d"}
            }
        };
    }
}