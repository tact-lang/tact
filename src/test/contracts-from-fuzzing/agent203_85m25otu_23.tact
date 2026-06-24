struct Deep {
    nested: NestedOpt?;
}

struct NestedOpt {
    val: Int as uint32;
    inner: InnerMost?;
}

struct InnerMost {
    x: Int as int64;
    flag: Bool?;
}

contract TestContract {
    field: Deep;

    init() {
        self.field = Deep{
            nested: NestedOpt{
                val: 1234,
                inner: InnerMost{
                    x: -12345678,
                    flag: null,
                },
            },
        };
    }
}