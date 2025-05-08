struct OptionalInner {
    z: Bool;
}

struct OptionalOuter {
    inner: OptionalInner?;
    s: String;
}

contract OptionalNestedField {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter {
            inner: null,
            s: "hi"
        };
    }
}
