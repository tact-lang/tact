struct InnerMost {
    data: Int;
}

struct Middle {
    nested: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract NestedOptionals {
    obj: Outer;

    init() {
        self.obj = Outer{
            middle: Middle{
                nested: InnerMost{
                    data: 42,
                },
            },
        };
    }
}