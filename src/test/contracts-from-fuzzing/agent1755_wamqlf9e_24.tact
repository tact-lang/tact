struct DeepOptional {
    v1: Int?;
    v2: String?;
    v3: Bool?;
}

struct OuterOpt {
    inner: DeepOptional;
    x: Int;
}

contract OptNestedLevel {
    nested: OuterOpt;
    init() {
        self.nested = OuterOpt{
            inner: DeepOptional{
                v1: null,
                v2: null,
                v3: null
            },
            x: 42
        };
    }
}