struct OptionalFields {
    flag: Bool?;
    number: Int?;
    message: String?;
}

contract OptionalInPersistent {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            flag: null,
            number: null,
            message: null
        };
    }
}