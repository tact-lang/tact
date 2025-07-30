struct InnerMost {
    x: Int;
}

struct Middle {
    innerMost: InnerMost?;
}

struct Outer {
    middle: Middle;
}

contract DeepOptionals {
    root: Outer?;

    init() {
        self.root = Outer{
            middle: Middle{
                innerMost: InnerMost{
                    x: 99,
                },
            },
        };
    }
}