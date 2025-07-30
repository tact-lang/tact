struct OptionalInner {
    a: Int?;
}

struct OptionalOuter {
    inner1: OptionalInner?;
    inner2: OptionalInner?;
}

contract NestedOptionals {
    data: OptionalOuter;
    init() {
        self.data = OptionalOuter{
            inner1: OptionalInner{ a: null },
            inner2: null
        };
    }
}