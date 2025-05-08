struct OptionalInner {
    s: String?;
}

struct OptionalOuter {
    inner: OptionalInner?;
}

contract OptionalInOptional {
    stored: OptionalOuter;

    init() {
        self.stored = OptionalOuter{
            inner: OptionalInner{ s: null }
        };
    }
}