struct DeepLeaf {
    val: Int?;
    flag: Bool;
}

struct MiddleLayer {
    leaf1: DeepLeaf;
    leaf2: DeepLeaf?;
    count: Int;
    toggle: Bool?;
}

struct RootLayer {
    mid: MiddleLayer;
    state: Bool;
}

contract DeepNestedMixedPersist {
    root: RootLayer;

    init() {
        self.root = RootLayer{
            mid: MiddleLayer{
                leaf1: DeepLeaf{ val: null, flag: true },
                leaf2: null,
                count: 77,
                toggle: false
            },
            state: true
        };
    }
}