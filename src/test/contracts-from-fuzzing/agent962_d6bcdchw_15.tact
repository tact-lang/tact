struct NestedOptionalStruct {
    innerOpt: Int?;
}

contract OptStructInContract {
    optStruct: NestedOptionalStruct?;

    init() {
        self.optStruct = null;
    }
}