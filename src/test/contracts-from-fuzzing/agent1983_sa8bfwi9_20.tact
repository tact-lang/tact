struct InnerLayer {
    a: Int?;
}

struct OuterWrap {
    inner: InnerLayer?;
}

contract DoubleOptField {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{
            inner: InnerLayer{ a: null }
        };
    }
}