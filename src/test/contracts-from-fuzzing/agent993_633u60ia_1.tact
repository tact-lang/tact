struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    x: Int;
    y: NestedInner;
    z: Bool;
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            x: 5,
            y: NestedInner{
                a: 1,
                b: false
            },
            z: true
        };
    }
}