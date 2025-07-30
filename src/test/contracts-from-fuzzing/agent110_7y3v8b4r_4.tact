struct OptionalStruct {
    note: String?;
    number: Int?;
}

contract OptionalFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            note: null,
            number: null
        };
    }
}