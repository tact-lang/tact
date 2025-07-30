struct NestedInner {
    valA: Int;
    optB: Bool?;
    text: String;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
    count: Int;
}

contract DeepStructStorage {
    bigField: NestedOuter;
    init() {
        self.bigField = NestedOuter{
            inner: NestedInner{
                valA: 1,
                optB: null,
                text: "hello"
            },
            flag: true,
            count: 42
        };
    }
}