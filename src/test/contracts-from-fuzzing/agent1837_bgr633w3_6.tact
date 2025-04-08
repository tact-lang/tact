struct InnerMost {
    bar: Int;
}

struct Middle {
    foo: InnerMost;
    maybeInner: InnerMost?;
}

struct Outer {
    middle: Middle;
    optMiddle: Middle?;
}

contract DeepOptionalContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            middle: Middle{
                foo: InnerMost{ bar: 7 },
                maybeInner: null
            },
            optMiddle: null
        };
    }
}