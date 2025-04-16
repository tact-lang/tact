struct OptionalInner {
    s: String?;
}

struct OptionalOuter {
    inner: OptionalInner?;
}

contract OptionalWrap {
    val: OptionalOuter;

    init() {
        self.val = OptionalOuter{
            inner: null
        };
    }
}