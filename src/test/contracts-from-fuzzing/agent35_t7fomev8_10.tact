struct InnerMost {
    f1: Int;
}

struct Middle {
    in1: InnerMost;
    in2: InnerMost;
    in3: InnerMost;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            m1: Middle{
                in1: InnerMost{ f1: 1 },
                in2: InnerMost{ f1: 2 },
                in3: InnerMost{ f1: 3 },
            },
            m2: Middle{
                in1: InnerMost{ f1: 4 },
                in2: InnerMost{ f1: 5 },
                in3: InnerMost{ f1: 6 },
            }
        };
    }
}
