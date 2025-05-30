struct InnerOptInt {
    value: Int?;
}

struct OuterOptInner {
    inner: InnerOptInt?;
    flag: Bool;
}

contract NestedOptionalsTest {
    s: OuterOptInner;

    init() {
        self.s = OuterOptInner{
            inner: null,
            flag: false
        };
    }
}