struct NestedInner {
    value: Int;
    flag: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    description: String;
}

contract NestedStructTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                value: 17,
                flag: false,
            },
            description: "Test",
        };
    }
}
