struct Inner {
    x: Int;
    y: String?;
}

struct Middle {
    i1: Inner;
    i2: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract FuzzTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            m1: Middle{
                i1: Inner{x: 1, y: null},
                i2: Inner{x: 2, y: "hi"}
            },
            m2: Middle{
                i1: Inner{x: 3, y: null},
                i2: Inner{x: 4, y: "bye"}
            }
        };
    }
}
