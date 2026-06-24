struct EmptyOptional {
    optInt: Int?;
}

struct Outer {
    inner: EmptyOptional;
    optInner: EmptyOptional?;
    optInt: Int?;
}

contract Test {
    stored: Outer;

    init() {
        self.stored = Outer{
            inner: EmptyOptional{ optInt: null },
            optInner: null,
            optInt: null
        };
    }
}