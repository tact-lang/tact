struct InnerOpt {
    field: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalsChain {
    data: OuterOpt?;

    init() {
        self.data = null;
    }
}