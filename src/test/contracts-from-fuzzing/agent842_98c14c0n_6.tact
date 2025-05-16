struct DeeplyNested {
    inner: InnerMost;
}

struct InnerMost {
    subInner: Final;
}

struct Final {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalNest {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner: InnerMost{
                subInner: Final{
                    foo: null,
                    bar: null,
                    baz: null
                }
            }
        };
    }
}