struct MixedFields {
    flag: Bool;
    number: Int;
    text: String?;
    maybeNum: Int?;
    yesno: Bool?;
    constant: Int;
}

contract MixedFieldsContract {
    data: MixedFields;
    init() {
        self.data = MixedFields {
            flag: true,
            number: 123,
            text: null,
            maybeNum: null,
            yesno: null,
            constant: 99
        };
    }
}
