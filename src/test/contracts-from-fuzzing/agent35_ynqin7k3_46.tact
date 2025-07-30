struct LeafD {
    y: Int = 99;
}

struct MidDOpt {
    leafD: LeafD?;
}

struct InnerDOpt {
    midDOpt: MidDOpt?;
}

struct OuterDOpt {
    innerDOpt: InnerDOpt?;
}

contract DeepOptionDefault {
    data: OuterDOpt?;

    init() {
        self.data = null;
    }
}