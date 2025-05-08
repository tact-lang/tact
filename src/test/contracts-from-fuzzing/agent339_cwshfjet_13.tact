struct OptionalInner {
    foo: Int?;
}

struct OptionalOuter {
    inner: OptionalInner?;
}

contract OptOuterStore {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            inner: null
        };
    }
}