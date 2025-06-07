struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    c: String;
}

contract TestContract {
    state: NestedOuter;
    
    init() {
        self.state = NestedOuter{
            inner: NestedInner{
                a: 5,
                b: true,
            },
            c: "hello",
        };
    }
}