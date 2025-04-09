struct NestedOpt {
    aa: Int?;
    bb: Bool?;
}

contract OptionalDeep {
    storage: NestedOpt;

    init() {
        self.storage = NestedOpt{ aa: null, bb: true };
    }
}
