struct InnerMost {
    value: Int?;
}

struct InnerNest {
    innerMost: InnerMost?;
    flag: Bool;
}

struct OuterNest {
    inner: InnerNest;
    num: Int;
}

contract DeepNestContract {
    data: OuterNest;

    init() {
        self.data = OuterNest{
            inner: InnerNest{
                innerMost: null,
                flag: true
            },
            num: 123
        };
    }
}