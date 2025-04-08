struct NestedBoolOpt {
    flag1: Bool?;
    flag2: Bool;
}

contract ContractOptStruct {
    s: NestedBoolOpt?;
    init() {
        self.s = null;
    }
}