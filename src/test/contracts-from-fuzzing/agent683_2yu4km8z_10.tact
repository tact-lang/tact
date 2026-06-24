struct SOpt {
    innerOpt: Bool?;
}

contract ContractOptStruct {
    s: SOpt?;

    init() {
        self.s = null;
    }
}