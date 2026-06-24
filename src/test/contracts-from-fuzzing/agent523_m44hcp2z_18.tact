struct NestedOptInOpt {
    val1: Int?;
    val2: String?;
}

contract OptChain {
    nested: NestedOptInOpt?;

    init() {
        self.nested = NestedOptInOpt{
            val1: 100,
            val2: "str"
        };
    }
}
