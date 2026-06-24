struct InnerMost {
    x: Int;
}

struct MiddleOpt {
    inner: InnerMost?;
}

struct OuterOpt {
    mid: MiddleOpt?;
}

contract DeepOptionalLayers {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            mid: MiddleOpt{
                inner: null
            }
        };
    }
}
