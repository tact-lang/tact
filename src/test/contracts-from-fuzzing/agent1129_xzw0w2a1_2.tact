struct OptionalInner {
    x: Int;
}

struct OptionalOuter {
    y: Int;
    inner: OptionalInner?;
}

contract OptionalNestedStorage {
    val: OptionalOuter;

    init() {
        self.val = OptionalOuter{
            y: 1,
            inner: null
        };
    }
}