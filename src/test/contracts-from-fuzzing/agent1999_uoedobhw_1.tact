struct NestedInner {
    a: Int;
    b: Int?;
}

struct NestedOuter {
    inner: NestedInner;
    c: Bool;
}

contract TestContract {
    nested: NestedOuter;
    
    init() {
        self.nested = NestedOuter{
            inner: NestedInner{
                a: 1,
                b: null,
            },
            c: true,
        };
    }
}