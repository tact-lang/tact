struct DoubleNesting {
    l1: InnerLevel;
}

struct InnerLevel {
    l2: InnerInner;
}

struct InnerInner {
    x: Int;
}

contract DoubleNestedContract {
    data: DoubleNesting;

    init() {
        self.data = DoubleNesting{
            l1: InnerLevel{
                l2: InnerInner{ x: 123 }
            }
        };
    }
}