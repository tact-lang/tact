struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool; 
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            inner: NestedInner{ a: 42, b: true },
            flag: false
        };
    }
}