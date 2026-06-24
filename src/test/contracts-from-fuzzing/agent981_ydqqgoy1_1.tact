struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    ni: NestedInner;
    c: String?;
}

contract StorageNested {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            ni: NestedInner{
                a: 42,
                b: true,
            },
            c: "hello"
        };
    }
}