struct InnerMost {
    d: Int;
}

struct Inner {
    c: InnerMost;
}

struct Outer {
    b: Inner;
}

contract NestedTest {
    field: Outer;

    init() {
        self.field = Outer{
            b: Inner{
                c: InnerMost{
                    d: 1
                }
            }
        };
    }
}