struct DeeplyNested {
    inner: Inner;
    optionalInner: Inner?;
    intOpt: Int?;
}

contract NestedTest {
    field: DeeplyNested;

    init() {
        self.field = DeeplyNested{
            inner: Inner{ flag: false, amount: null },
            optionalInner: null,
            intOpt: null,
        };
    }
}

struct Inner {
    flag: Bool;
    amount: Int?;
}
