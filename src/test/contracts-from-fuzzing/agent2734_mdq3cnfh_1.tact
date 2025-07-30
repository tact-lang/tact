struct NestedInner {
    val1: Int;
    val2: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                val1: 42,
                val2: true,
            },
            flag: false,
        };
    }
}
