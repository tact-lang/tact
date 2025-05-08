struct MultiLayerDefs {
    a: Int = 1;
    b: Bool;
}

struct ContainDefaults {
    nested: MultiLayerDefs = MultiLayerDefs{b:false};
}

contract NestedWithExplicitDefaults {
    fld: ContainDefaults;

    init() {
        self.fld = ContainDefaults{};
    }
}
