struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost;
}

struct OuterMost {
    middle: Middle;
}

contract Deep1 {
    deepVal: OuterMost;

    init() {
        self.deepVal = OuterMost{ middle: Middle{ inner: InnerMost{ value: 42 } } };
    }
}