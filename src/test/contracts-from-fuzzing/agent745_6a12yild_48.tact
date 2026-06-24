struct DeepOpt {
    foo: Int?;
}

struct MoreOpt {
    nested: DeepOpt?;
}

contract NestedOptionalLayers {
    layer: MoreOpt;

    init() {
        self.layer = MoreOpt{ nested: null };
    }
}