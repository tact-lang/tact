struct InnerMost {
    magic: Int;
}

struct Middle {
    i1: InnerMost;
    i2: InnerMost;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract MultipleNestedStructs {
    data: Outer;
    init() {
        self.data = Outer{
            m1: Middle{
                i1: InnerMost{ magic: 1 },
                i2: InnerMost{ magic: 2 }
            },
            m2: Middle{
                i1: InnerMost{ magic: 3 },
                i2: InnerMost{ magic: 4 }
            }
        };
    }
}