struct NestedInner {
    val1: Int;
    val2: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool?;
    number: Int?;
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            inner: NestedInner{ val1: 1, val2: true },
            flag: true,
            number: 42,
        };
    }
}