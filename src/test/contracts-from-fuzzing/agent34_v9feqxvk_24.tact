struct InnerStruct {
    flag: Bool;
}

contract ContractWithOptionalStruct {
    state: InnerStruct?;

    init() {
        self.state = InnerStruct{ flag: true };
    }
}