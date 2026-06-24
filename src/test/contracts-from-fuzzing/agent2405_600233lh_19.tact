struct DeepOpt {
    value: Int?;
}

struct MidOpt {
    inner: DeepOpt?;
}

contract OptChain {
    data: MidOpt?;

    init() {
        self.data = null;
    }
}