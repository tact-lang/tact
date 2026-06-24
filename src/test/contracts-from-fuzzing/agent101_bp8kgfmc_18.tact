struct LeafY { q: Int; }

struct RootY {
    innerOpt: LeafY? = LeafY{ q: 50 };
}

contract OptStructDefault {
    data: RootY = RootY{};

    init() {
        self.data = RootY{ innerOpt: null };
    }
}