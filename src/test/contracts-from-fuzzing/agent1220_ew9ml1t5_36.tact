struct NestedLayer {
    layer: OuterOpt?;
}

struct OuterOpt {
    inn: InnerOpt;
}

struct InnerOpt {
    a: Int?;
}

contract OptionalLayered {
    d: NestedLayer;

    init() {
        self.d = NestedLayer{
            layer: null
        };
    }
}