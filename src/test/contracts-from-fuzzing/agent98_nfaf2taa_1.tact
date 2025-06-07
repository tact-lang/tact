struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    c: Int;
    d: NestedInner;
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{ c: 1, d: NestedInner{ a: 2, b: true } };
    }
}