struct InnerOpt {
    v: Int?;
}

contract ContractWithInnerOpt {
    inner: InnerOpt;

    init() {
        self.inner = InnerOpt{ v: null };
    }
}