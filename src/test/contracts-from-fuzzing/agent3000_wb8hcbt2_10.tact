struct OptionalInner {
    f1: Int?;
    f2: String?;
}

struct NestedOptionalOuter {
    inner: OptionalInner?;
    id: Int;
}

contract Test10 {
    n: NestedOptionalOuter;

    init() {
        self.n = NestedOptionalOuter{
            inner: OptionalInner{
                f1: 77,
                f2: null,
            },
            id: 100,
        };
    }
}
