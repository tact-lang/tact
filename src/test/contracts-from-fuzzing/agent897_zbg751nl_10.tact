struct InnerMost {
    x: Int;
    y: Int;
}

struct Middle {
    a: InnerMost;
    b: InnerMost;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle{
                a: InnerMost{ x:1, y:2 },
                b: InnerMost{ x:3, y:4 }
            },
            m2: Middle{
                a: InnerMost{ x:5, y:6 },
                b: InnerMost{ x:7, y:8 }
            }
        };
    }
}