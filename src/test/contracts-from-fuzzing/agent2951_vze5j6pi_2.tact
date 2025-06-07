struct NestedInner {
    a: Int;
    b: Bool?;
    c: String;
}

struct NestedOuter {
    inner: NestedInner;
    d: Address;
    e: Int?;
}

contract DeepNestedContract {
    storage: NestedOuter;
    
    init() {
        self.storage = NestedOuter{
            inner: NestedInner{ a: 1, b: null, c: "hi" },
            d: myAddress(),
            e: null
        };
    }
}