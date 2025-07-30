struct OpInStruct {
    f: Int?;
}

contract TestContract {
    s1: OpInStruct?;
    s2: OpInStruct?;
    init() {
        self.s1 = null;
        self.s2 = OpInStruct{ f: null };
    }
}