struct Inner {
    val: Int?;
}

contract TestNestedOptionalChain {
    sOpt: Inner? = null;

    init() {
        self.sOpt = Inner{val: 123};
    }
}