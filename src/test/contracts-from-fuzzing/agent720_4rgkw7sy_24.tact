struct InnerMost {
    q: Int;
    r: Int;
}

struct MiddleStruct {
    inner: InnerMost;
}

struct OuterMost {
    m: MiddleStruct;
}

contract DeepChain {
    data: OuterMost;

    init() {
        self.data = OuterMost{ m: MiddleStruct{ inner: InnerMost{ q: 5, r: 10 } } };
    }
}