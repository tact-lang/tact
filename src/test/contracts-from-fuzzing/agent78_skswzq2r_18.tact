struct DeepOpt {
    val: Int?;
    nested: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Int?;
}

contract OptChainPersistent {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{ val: null, nested: null };
    }
}