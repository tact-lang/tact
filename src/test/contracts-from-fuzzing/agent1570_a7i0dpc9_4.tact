struct OptionalWrap {
    innerOpt: Int?;
}

contract TestContract {
    myOpt: OptionalWrap;
    init() {
        self.myOpt = OptionalWrap{ innerOpt: null };
    }
}