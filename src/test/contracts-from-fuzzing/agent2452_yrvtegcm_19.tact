struct InnerOpt {
    val: Int?;
}

contract ContractDeepOptional {
    nested: InnerOpt? = null;

    init() {
        self.nested = null;
    }
}