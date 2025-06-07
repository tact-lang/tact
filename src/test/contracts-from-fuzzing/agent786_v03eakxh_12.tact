struct DeepOptional {
    innermost: Int?;
}

struct MidOptional {
    optDeep: DeepOptional?;
}

contract OptionalChain {
    chain: MidOptional?;

    init() {
        self.chain = null;
    }
}