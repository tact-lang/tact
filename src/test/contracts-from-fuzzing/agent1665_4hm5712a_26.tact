struct Deeply {
    a: Int;
    b: String;
}

struct Middle {
    d1: Deeply;
    d2: Deeply;
}

struct TopLevel {
    m1: Middle;
    m2: Middle;
}

contract Test26 {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            m1: Middle{
                d1: Deeply{a:1, b:"a"},
                d2: Deeply{a:2, b:"b"}
            },
            m2: Middle{
                d1: Deeply{a:3, b:"c"},
                d2: Deeply{a:4, b:"d"}
            }
        };
    }
}