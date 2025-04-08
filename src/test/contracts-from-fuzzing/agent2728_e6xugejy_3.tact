struct OptionalStruct {
    note: String?;
    flag: Bool?;
    number: Int?;
}

contract Test {
    optData: OptionalStruct;

    init() {
        self.optData = OptionalStruct{
            note: null,
            flag: null,
            number: null
        };
    }
}
