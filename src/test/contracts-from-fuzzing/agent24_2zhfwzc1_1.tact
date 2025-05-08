struct NestedInner {
    value: Int;
    flag: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    note: String;
    isActive: Bool;
}

contract NestedFieldsTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                value: 42,
                flag: true,
            },
            note: "Nested test",
            isActive: false,
        };
    }
}