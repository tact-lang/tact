struct DeepOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
}

contract DeeplyOptionalized {
    innerMost: DeepOpt?;

    init() {
        self.innerMost = null;
    }
}