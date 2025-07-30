struct InnerMost {
    foo: Int?;
}

struct InnerWrap {
    im: InnerMost;
}

struct OuterWrap {
    inner: InnerWrap?;
}

contract DeepNullableStruct {
    val: OuterWrap;

    init() {
        self.val = OuterWrap{
            inner: null
        };
    }
}