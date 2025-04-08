struct NestedInner {
    x: Int;
    y: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract TestContract {
    state: NestedOuter;
    
    init() {
        self.state = NestedOuter{
            inner: NestedInner{
                x: 1,
                y: true,
            },
            flag: false,
        };
    }
}