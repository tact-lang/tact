struct InnerMost {
    a: Int;
    b: Bool;
}

struct MiddleWrap {
    inner: InnerMost;
}

struct OuterWrap {
    nested: MiddleWrap;
}

contract UltraNested {
    data: OuterWrap;
    init() {
        self.data = OuterWrap{ nested: MiddleWrap{ inner: InnerMost{ a: 1, b: true } } };
    }
}