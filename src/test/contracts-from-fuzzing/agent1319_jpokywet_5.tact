struct InnerMost {
    val: Int;
}

struct Middle {
    a: InnerMost?;
    b: InnerMost?;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract NestedOptionals {
    st: Outer;

    init() {
        self.st = Outer{
            m1: Middle{
                a: null,
                b: InnerMost{val: 7}
            },
            m2: Middle{
                a: null,
                b: null
            }
        };
    }
}