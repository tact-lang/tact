struct OptionalNest {
    innerOpt: Int?;
    flag: Bool?;
}

contract OptionalHolder {
    optStruct: OptionalNest?;

    init() {
        self.optStruct = null;
    }
}
