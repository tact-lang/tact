struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    message: String;
}

contract NestedStructTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                a: 1,
                b: null,
            },
            message: "Test",
        };
    }
}