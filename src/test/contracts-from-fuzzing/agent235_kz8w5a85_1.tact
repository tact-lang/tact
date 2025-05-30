struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    z: Int;
    inner: NestedInner;
    w: Bool;
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            z: 7,
            inner: NestedInner{
                a: 1,
                b: true,
            },
            w: false
        };
    }
}