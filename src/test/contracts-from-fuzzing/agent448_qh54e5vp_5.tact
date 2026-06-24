struct OptionalFields {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract OptionalFieldsContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            intOpt: null,
            boolOpt: null,
            stringOpt: "hello"
        };
    }
}