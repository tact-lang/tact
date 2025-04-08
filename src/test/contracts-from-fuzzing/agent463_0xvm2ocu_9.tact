struct OuterMost {
    inner: InnerMost;
}

struct InnerMost {
    value: Int;
}

contract OutOfOrderTest {
    s: OuterMost;
    init() {
        self.s = OuterMost{
            inner: InnerMost{ value: 42 }
        };
    }
}
