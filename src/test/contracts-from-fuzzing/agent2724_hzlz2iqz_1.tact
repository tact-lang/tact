struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    c: String;
}

contract DeepNestedContract {
    field: NestedOuter;
    
    init() {
        self.field = NestedOuter{
            inner: NestedInner{
                a: 1,
                b: true,
            },
            c: "test",
        };
    }
}