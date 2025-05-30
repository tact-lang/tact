struct DeeplyNested {
    innermost: Int;
}

struct MiddleNested {
    inner: DeeplyNested;
    optInner: DeeplyNested?;
}

struct Outer {
    mid: MiddleNested;
    optMid: MiddleNested?;
}

contract Test {
    store: Outer;

    init() {
        self.store = Outer{
            mid: MiddleNested{
                inner: DeeplyNested{ innermost: 1 },
                optInner: null,
            },
            optMid: null,
        };
    }
}