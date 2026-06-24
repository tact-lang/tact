struct OuterWrap {
    inner: Int?;
    nested: InnerWrap?;
}

struct InnerWrap {
    value: Int;
}

contract TestContract {
    val: OuterWrap;

    init() {
        self.val = OuterWrap{
            inner: null,
            nested: InnerWrap{ value: 42 }
        };
    }
}