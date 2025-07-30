struct InnerOpt {
    innerVal: Int?;
}

struct OuterOpt {
    opt: InnerOpt?;
}

contract OptionalLayers {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            opt: null
        };
    }
}