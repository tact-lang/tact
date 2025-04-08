struct DeepOpt {
    nestedOpt: MiddleOpt?;
}

struct MiddleOpt {
    nestedBool: Bool?;
    nestedInt: Int;
}

contract OptChain {
    chain: DeepOpt;

    init() {
        self.chain = DeepOpt{ nestedOpt: null };
    }
}