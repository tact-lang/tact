struct OptionalStruct {
    num: Int?;
    txt: String?;
    flag: Bool?;
}

contract AllOptional {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            num: null,
            txt: null,
            flag: null
        };
    }
}
