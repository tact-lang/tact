struct OptionStruct {
    number: Int?;
    text: String?;
    flag: Bool?;
}

contract OptFieldsStorage {
    data: OptionStruct;

    init() {
        self.data = OptionStruct{
            number: null,
            text: null,
            flag: null,
        };
    }
}