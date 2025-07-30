struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    ni: NestedInner;
    optionalNi: NestedInner?;
    number: Int;
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            ni: NestedInner{a: 1, b: true},
            optionalNi: null,
            number: 42
        };
    }
}