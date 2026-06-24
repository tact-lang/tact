struct OptionStruct {
    val: Int?;
}

contract OptionalAsField {
    optStruct: OptionStruct?;

    init() {
        self.optStruct = null;
    }
}