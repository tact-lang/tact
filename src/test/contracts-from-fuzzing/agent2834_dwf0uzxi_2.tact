struct NestedInner {
    foo: Int?;
    bar: Bool;
    buzz: String;
}

struct NestedOuter {
    inner: NestedInner?;
    label: String;
}

contract OptionalNestedTest {
    payload: NestedOuter;

    init() {
        self.payload = NestedOuter{
            inner: null,
            label: "optional test"
        };
    }
}