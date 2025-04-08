struct OptionalInner {
    s: String;
}

struct OptionalMiddle {
    inner: OptionalInner?;
}

contract OptMiddleContainer {
    field: OptionalMiddle;

    init() {
        self.field = OptionalMiddle{
            inner: null,
        };
    }
}