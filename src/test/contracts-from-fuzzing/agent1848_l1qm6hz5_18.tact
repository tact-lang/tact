struct OptionStruct {
    maybeNum: Int?;
    maybeBool: Bool?;
    maybeText: String?;
}

contract DoubleOptional {
    one: OptionStruct?;
    two: OptionStruct?;

    init() {
        self.one = null;
        self.two = null;
    }
}