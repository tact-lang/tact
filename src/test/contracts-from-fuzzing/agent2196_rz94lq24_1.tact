struct Nested {
    value1: Int;
    value2: Int;
}

struct DeepNest {
    inner: Nested;
    optionalInner: Nested?;
}

contract TestContract {
    data: DeepNest;
    
    init() {
        self.data = DeepNest {
            inner: Nested{ value1: 1, value2: 2 },
            optionalInner: null
        };
    }
}