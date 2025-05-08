struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    n: NestedInner;
    c: Bool;
}

contract DeepNest {
    val: NestedOuter;
    
    init() {
        self.val = NestedOuter{
            n: NestedInner{ a: 1, b: true },
            c: false
        };
    }
}