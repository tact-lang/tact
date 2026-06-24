struct InnerOpt {
    value: Int;
}

contract OptionalsReassign {
    optStruct: InnerOpt?;
    optInt: Int?;

    init() {
        self.optStruct = null;
        self.optInt = null;
        self.optStruct = InnerOpt{ value: 123 };
        self.optInt = 456;
    }
}
