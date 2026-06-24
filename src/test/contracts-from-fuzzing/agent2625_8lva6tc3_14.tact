struct InnerMost {
    x: Int;
    y: Bool;
}

struct InnerWrap {
    a: Int?;
    b: InnerMost;
}

struct OuterWrap {
    inner: InnerWrap;
}

contract OptNesting {
    st: OuterWrap;

    init() {
        self.st = OuterWrap{
            inner: InnerWrap{
                a: null,
                b: InnerMost{ x: 12, y: true }
            }
        };
    }
}