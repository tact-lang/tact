struct InnerMost {
    value: Int?;
}

struct InnerWrap {
    data: InnerMost?;
}

struct OuterWrap {
    inner: InnerWrap?;
}

contract OptionalNest {
    val: OuterWrap;
    
    init() {
        self.val = OuterWrap{
            inner: InnerWrap{
                data: InnerMost{
                    value: 123
                }
            }
        };
    }
}
