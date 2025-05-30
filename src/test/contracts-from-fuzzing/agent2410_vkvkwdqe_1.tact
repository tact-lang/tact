struct NestedInner {
    flag: Bool;
    text: String;
    amount: Int;
}

struct NestedOuter {
    inner: NestedInner;
    count: Int;
    note: String;
}

contract DeepNestedTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                flag: true,
                text: "deep",
                amount: 42,
            },
            count: 99,
            note: "nested",
        };
    }
}