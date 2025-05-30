struct OptionalDeep {
    t: Int?;
    s: String?;
}

struct NestedOptionalLayer {
    inner: OptionalDeep?;
    flag: Bool;
}

contract OptionalLayers {
    nopt: NestedOptionalLayer;

    init() {
        self.nopt = NestedOptionalLayer{inner: null, flag:true};
    }
}