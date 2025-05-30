struct InnerMost {
    number: Int;
}

struct Middle {
    innerMost1: InnerMost;
    innerMost2: InnerMost;
}

struct Outer {
    middle1: Middle;
    middle2: Middle;
}

contract MultiNested {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle1: Middle{
                innerMost1: InnerMost{number:1},
                innerMost2: InnerMost{number:2}
            },
            middle2: Middle{
                innerMost1: InnerMost{number:3},
                innerMost2: InnerMost{number:4}
            }
        };
    }
}