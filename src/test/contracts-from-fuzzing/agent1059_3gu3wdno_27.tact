struct DeepOptional {
    i: Int?;
}

struct OptionalWrap {
    w: DeepOptional?;
}

contract OptionalLayers {
    f: OptionalWrap;
    init() {
        self.f = OptionalWrap{ w: null };
    }
}