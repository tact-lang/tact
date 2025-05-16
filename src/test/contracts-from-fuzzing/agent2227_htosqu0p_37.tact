struct OptionalStruct {
    n: Int;
}

contract ContractOptStruct {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}