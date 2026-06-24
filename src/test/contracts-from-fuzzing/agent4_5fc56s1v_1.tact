struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    c: String;
    d: NestedInner;
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            c: "hello",
            d: NestedInner{
                a: 1,
                b: true,
            },
        };
    }
}