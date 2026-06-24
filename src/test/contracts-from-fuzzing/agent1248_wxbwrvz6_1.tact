struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    c: NestedInner; 
    d: Int?;
    e: Bool;
}

contract NestedContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            c: NestedInner{ a: 1, b: true },
            d: null,
            e: false
        };
    }
}
