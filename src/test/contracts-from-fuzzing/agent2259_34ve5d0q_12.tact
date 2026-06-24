struct OptionStruct {
    val: Int?;
}

contract OptionalInStruct {
    data: OptionStruct;

    init() {
        self.data = OptionStruct{ val: null };
    }
}