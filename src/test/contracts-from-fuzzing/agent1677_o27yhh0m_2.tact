struct InnerMost {
    value: Int;
}

struct Inner {
    maybeInnerMost: InnerMost?;
}

struct Outer {
    maybeInner: Inner?;
    num: Int;
}

contract DeeplyNestedOptionalStruct {
    data: Outer;

    init() {
        self.data = Outer{
            maybeInner: null,
            num: 42,
        };
    }
}