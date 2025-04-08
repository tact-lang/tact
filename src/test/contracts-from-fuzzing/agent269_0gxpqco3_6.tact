struct NestedOpt {
    x: Int? = null;
    y: Bool? = null;
}

contract OptStructs {
    nestedOpt: NestedOpt = NestedOpt{};

    init() {
        self.nestedOpt = NestedOpt{ x: 11, y: true };
    }
}