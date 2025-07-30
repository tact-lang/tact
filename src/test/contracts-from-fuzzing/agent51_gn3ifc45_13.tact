struct DeepOption {
    a: Int?;
}

struct DoubleDeeper {
    b: DeepOption?;
}

contract NullableChain {
    x: DoubleDeeper?;
    init() {
        self.x = DoubleDeeper{ b: DeepOption{ a: null } };
    }
}
