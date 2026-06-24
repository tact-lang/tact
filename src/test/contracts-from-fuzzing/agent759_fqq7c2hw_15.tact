struct DeepOpt {
    val: Int?;
}

struct MidOpt {
    opt: DeepOpt?;
}

struct TopOpt {
    nested: MidOpt?;
}

contract NullableNesting {
    f: TopOpt;

    init() {
        self.f = TopOpt{ nested: null };
    }
}
