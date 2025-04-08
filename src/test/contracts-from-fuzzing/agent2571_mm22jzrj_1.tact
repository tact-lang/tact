struct NestedInner {
    x: Int;
    y: Int?;
}

struct NestedOuter {
    inner: NestedInner;
    name: String;
}

contract DeepTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                x: 1,
                y: null,
            },
            name: "test",
        };
    }
}
