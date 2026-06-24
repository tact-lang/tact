struct NestedInner {
    flag: Bool;
    note: String;
}

struct NestedOuter {
    count: Int;
    inner: NestedInner;
    description: String?;
}

contract DeepStructTest {
    nestedField: NestedOuter;

    init() {
        self.nestedField = NestedOuter{
            count: 5,
            inner: NestedInner{
                flag: true,
                note: "Test"
            },
            description: null
        };
    }
}
