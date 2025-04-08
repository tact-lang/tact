struct OptionalDeep {
    innerLayer: MiddleLayer?;
}

struct MiddleLayer {
    inner: InnerLayer?;
}

struct InnerLayer {
    value: Int?;
}

contract TestContract {
    f: OptionalDeep;

    init() {
        self.f = OptionalDeep{
            innerLayer: null
        };
    }
}