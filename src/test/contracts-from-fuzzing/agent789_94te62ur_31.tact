struct NestedInner {
    x: Int?;
    y: Bool?;
}

struct NestedOuter {
    inner: NestedInner?;
    s: String;
}

contract OptionalNestedOuterTest {
    obj: NestedOuter;

    init() {
        self.obj = NestedOuter {
            inner: null,
            s: "hello"
        };
    }
}
