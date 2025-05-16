struct NestedInner {
    value: Int;
    flag: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    note: String;
    flag2: Bool;
}

contract DeepNestedTest {
    nestedField: NestedOuter;
    another: Int;

    init() {
        self.nestedField = NestedOuter{
            inner: NestedInner{
                value: 42,
                flag: true,
            },
            note: "hello",
            flag2: false,
        };
        self.another = 7;
    }
}