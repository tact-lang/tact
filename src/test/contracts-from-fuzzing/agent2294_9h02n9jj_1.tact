struct NestedInner {
    val: Int;
    flag: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    text: String;
    optInt: Int?;
}

contract NestedStructPersistence {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            inner: NestedInner{val: 1, flag: true},
            text: "hello",
            optInt: null,
        };
    }
}