struct BigNested {
    x1: Int;
    x2: Int?;
    x3: Int;
    y: InnerBig;
}

struct InnerBig {
    i1: Bool?;
    i2: InnerInnerBig;
}

struct InnerInnerBig {
    d1: String?;
    d2: Bool;
}

contract DeepAndWide {
    storage: BigNested;
    init() {
        self.storage = BigNested{
            x1: 11,
            x2: null,
            x3: 33,
            y: InnerBig{
                i1: true,
                i2: InnerInnerBig{
                    d1: null,
                    d2: false,
                },
            },
        };
    }
}