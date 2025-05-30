struct InnerNestedOpt {
    optBool: Bool?;
    optStr: String?;
}

contract ContractWithOptionalStruct {
    data: InnerNestedOpt?;

    init() {
        self.data = null;
    }
}