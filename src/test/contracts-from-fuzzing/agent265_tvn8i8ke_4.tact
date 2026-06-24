struct OptionalInner {
    optField: Int?;
}

struct OptionalOuter {
    inner: OptionalInner?;
}

contract Test {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            inner: OptionalInner{
                optField: null,
            },
        };
    }
}