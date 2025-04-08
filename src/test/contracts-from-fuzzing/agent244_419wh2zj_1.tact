struct NestedInner {
    value: Int;
    flag: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    description: String;
}

contract TestContract {
    record: NestedOuter;
    
    init() {
        self.record = NestedOuter{
            inner: NestedInner{
                value: 1,
                flag: true,
            },
            description: "test",
        };
    }
}