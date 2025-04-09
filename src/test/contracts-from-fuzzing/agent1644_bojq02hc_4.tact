struct OptionalFields {
    label: String?;
    number: Int?;
    flag: Bool?;
}

contract OptionalFieldsContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            label: null,
            number: null,
            flag: null
        };
    }
}