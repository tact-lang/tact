struct NestedInner {
    flag: Bool;
    amount: Int as uint32;
}

struct NestedOuter {
    inner: NestedInner;
    description: String;
    isActive: Bool;
}

contract WithNestedStructs {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                flag: true,
                amount: 123,
            },
            description: "Test",
            isActive: true,
        };
    }
}