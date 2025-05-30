struct DeeplyOptionalNested {
    one: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    two: Int?;
    inner2: InnerOpt2?;
}

struct InnerOpt2 {
    three: Int?;
}

contract DeepNestOptionalContract {
    optionalData: DeeplyOptionalNested;

    init() {
        self.optionalData = DeeplyOptionalNested{
            one: null,
            inner: null
        };
    }
}
