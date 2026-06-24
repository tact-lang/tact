struct InnerVals {
    v1: Bool;
    v2: Bool?;
    v3: Int;
    v4: Int?;
    v5: String?;
}

contract OptionalMixNested {
    inner: InnerVals;
    
    init() {
        self.inner = InnerVals{
            v1: true,
            v2: null,
            v3: 42,
            v4: null,
            v5: "hello"
        };
    }
}