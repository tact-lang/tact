struct InnerDepth {
    maybe: Int?;
    note: String?;
}

struct MiddleDepth {
    inner: InnerDepth;
    flag: Bool?;
}

contract OptionalNested {
    field: MiddleDepth;

    init() {
        self.field = MiddleDepth{
            inner: InnerDepth{ maybe: null, note: null },
            flag: null
        };
    }
}