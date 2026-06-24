struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    c: Int?;
    d: String;
}

contract DeepNestedTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{ a: 1, b: true },
            c: null,
            d: "hello",
        };
    }
}