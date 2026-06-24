struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract DeepNest {
    o: Outer;

    init() {
        self.o = Outer{
            middle: Middle{
                inner: InnerMost{
                    val: 555
                }
            }
        };
    }
}