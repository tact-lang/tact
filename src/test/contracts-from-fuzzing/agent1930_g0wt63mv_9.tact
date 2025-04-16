struct ManyOptionalNesting {
    s1: Inner?;
    s2: Inner?;
    s3: Inner?;
    s4: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
}

contract NestedOpts {
    data: ManyOptionalNesting;

    init() {
        self.data = ManyOptionalNesting{
            s1: Inner{ x: 1, y: null },
            s2: null,
            s3: Inner{ x: null, y: true },
            s4: null
        };
    }
}