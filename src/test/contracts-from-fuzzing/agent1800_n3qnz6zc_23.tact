struct OptionalInner {
    val: Int?;
}

contract ContractWithNestedOpt {
    inner: OptionalInner;

    init() {
        self.inner = OptionalInner{
            val: null
        };
    }
}