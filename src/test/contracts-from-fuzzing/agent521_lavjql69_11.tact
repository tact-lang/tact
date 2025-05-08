struct InnerMost {
    x: Int;
    y: Int;
}

struct Middle {
    inner: InnerMost;
    optionalInner: InnerMost?;
}

struct Outer {
    middle: Middle;
}

contract DeepNestingOptionals {
    storage: Outer;

    init() {
        self.storage = Outer{
            middle: Middle{
                inner: InnerMost{ x: 1, y: 2 },
                optionalInner: null,
            }
        };
    }
}