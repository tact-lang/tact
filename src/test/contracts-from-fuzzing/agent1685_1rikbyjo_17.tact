struct DeepOpt {
    inner: Int?;
    another: Bool?;
}

struct TopOpt {
    nested: DeepOpt?;
}

contract ComplexOpt {
    store: TopOpt;

    init() {
        self.store = TopOpt{ nested: null };
    }
}
