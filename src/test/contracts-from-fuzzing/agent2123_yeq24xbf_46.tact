struct MixedOpt {
    x: Int?;
    y: Bool?;
}

contract NestedMixedOpt {
    data: MixedOpt?;

    init() {
        self.data = null;
    }
}