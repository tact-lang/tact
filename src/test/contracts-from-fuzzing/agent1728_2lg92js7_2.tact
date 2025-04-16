struct NestedInner {
    flag: Bool;
    count: Int;
}

struct NestedOuter {
    inner: NestedInner;
    message: String;
}

contract NestedStructStorage {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                flag: true,
                count: 42,
            },
            message: "test",
        };
    }
}