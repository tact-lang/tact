struct InnerMost {
    val: Int;
}

struct Middle {
    a: InnerMost;
    b: InnerMost;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract MultiNested {
    data: Outer;

    init() {
        self.data = Outer{
            mid1: Middle{
                a:InnerMost{val:1}, b:InnerMost{val:2}
            },
            mid2: Middle{
                a:InnerMost{val:3}, b:InnerMost{val:4}
            }
        };
    }
}