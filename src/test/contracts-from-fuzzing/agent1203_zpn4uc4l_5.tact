struct OptionalField {
    number: Int?;
    text: String?;
    flag: Bool?;
}

contract OptionalInState {
    data: OptionalField;

    init() {
        self.data = OptionalField{number: null, text: null, flag: null};
    }
}