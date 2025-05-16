contract DeepOptionalContract {
    data: ComplexData;

    init() {
        self.data = ComplexData{
            nested: Nested{
                inner: Inner{
                    intOpt: null,
                    boolOpt: true,
                },
                strOpt: null,
            },
            simpleOpt: null,
        };
    }
}

struct ComplexData {
    nested: Nested;
    simpleOpt: Bool?;
}

struct Nested {
    inner: Inner;
    strOpt: String?;
}

struct Inner {
    intOpt: Int?;
    boolOpt: Bool?;
}
