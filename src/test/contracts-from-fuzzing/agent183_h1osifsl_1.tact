struct NestedInner {
    value: Int;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract TestContract {
    nested: NestedOuter;
    
    init() {
        self.nested = NestedOuter{
            inner: NestedInner{value: 123},
            flag: true
        };
    }
}