struct InnerMost {
    val1: Int?;
    val2: Int;
}

struct Inner {
    field: InnerMost?;
}

struct Outer {
    nested: Inner;
}

contract TestContract {
    composite: Outer;

    init() {
        self.composite = Outer{
            nested: Inner{
                field: InnerMost{
                    val1: null,
                    val2: 5,
                }
            }
        };
    }
}