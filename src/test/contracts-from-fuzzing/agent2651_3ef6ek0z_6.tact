struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost;
}

struct Middle {
    nested: Inner;
}

struct Outer {
    nested: Middle;
}

contract DeepNestContract {
    field: Outer;

    init() {
        self.field = Outer{
            nested: Middle{
                nested: Inner{
                    nested: InnerMost{
                        val: 123,
                    },
                },
            },
        };
    }
}