struct NestedInner {
    a: Int = 1;
    b: Bool = true;
}

struct NestedOuter {
    inner: NestedInner;
    s: String = "test";
}

contract DeepNestedTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                a: 42,
                b: false,
            },
            s: "nested"
        };
    }
}