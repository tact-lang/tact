struct OptionalStruct {
    param: Int?;
    flag: Bool?;
}

contract WithOptionalField {
    optField: OptionalStruct;

    init() {
        self.optField = OptionalStruct{
            param: null,
            flag: true,
        };
    }
}