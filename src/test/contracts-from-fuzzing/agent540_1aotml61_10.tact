struct InnerLayer {
    i: Int;
}

struct MidLayer {
    inner1: InnerLayer;
    inner2: InnerLayer;
}

struct OuterLayer {
    m1: MidLayer;
    m2: MidLayer;
}

contract ManyNested {
    dat: OuterLayer;

    init() {
        self.dat = OuterLayer{
            m1: MidLayer{
                inner1: InnerLayer{ i: 1 },
                inner2: InnerLayer{ i: 2 }
            },
            m2: MidLayer{
                inner1: InnerLayer{ i: 3 },
                inner2: InnerLayer{ i: 4 }
            }
        };
    }
}