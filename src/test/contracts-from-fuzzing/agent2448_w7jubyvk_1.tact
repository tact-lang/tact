struct NestedInner {
    val1: Int;
    val2: Bool;
}

struct NestedOuter {
    optInner: NestedInner?;
    amount: Int;
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            optInner: null,
            amount: 123,
        };
    }
}
