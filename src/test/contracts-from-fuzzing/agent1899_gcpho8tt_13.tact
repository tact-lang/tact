struct ComboFields {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract ComboFieldsContract {
    data: ComboFields;

    init() {
        self.data = ComboFields{
            intField: 5,
            boolField: true,
            stringField: "test",
            optInt: null,
            optBool: false,
            optString: null
        };
    }
}