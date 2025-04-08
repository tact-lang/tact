struct Deep {
    v: Int?;
}

contract OptionalDeep {
    nestedOpt: Deep?;

    init() {
        self.nestedOpt = null;
    }
}