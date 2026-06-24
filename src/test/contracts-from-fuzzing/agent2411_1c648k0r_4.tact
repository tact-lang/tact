struct OptionStruct {
    value: Int?;
    text: String?;
    flag: Bool?;
}

contract OptionalFields {
    data: OptionStruct;

    init() {
        self.data = OptionStruct{
            value: null,
            text: null,
            flag: null,
        };
    }
}