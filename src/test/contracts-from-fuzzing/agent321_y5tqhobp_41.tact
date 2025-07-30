struct InnerOptLevel {
    a: Int?;
    b: Bool?;
}

struct OuterOptLevel {
    nested: InnerOptLevel?;
    c: Bool?;
}

struct TopWrapper {
    deep: OuterOptLevel?;
    d: Int?;
}

contract MultiOptionalLayers {
    data: TopWrapper;
    init() {
        self.data = TopWrapper{
            deep: null,
            d: null
        };
    }
}