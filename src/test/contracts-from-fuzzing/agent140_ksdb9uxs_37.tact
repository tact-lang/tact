struct PairOpt {
    left: Int?;
    right: Int?;
}

struct NestedOpt {
    pair: PairOpt?;
}

contract ComplexOpt {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{ pair: null };
    }
}