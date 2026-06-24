struct OptionalStruct {
    flag: Bool?;
    note: String?;
}

contract OptionalFieldContract {
    optField: OptionalStruct;

    init() {
        self.optField = OptionalStruct{
            flag: null,
            note: null,
        };
    }
}