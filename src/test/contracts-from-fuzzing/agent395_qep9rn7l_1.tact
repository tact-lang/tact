struct NestedInner {
    val1: Int;
    flag: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    text: String;
}

contract DeepNestedTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                val1: 123,
                flag: true
            },
            text: "test"
        };
    }
}
