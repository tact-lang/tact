struct MixTypes {
    intField: Int;
    boolField: Bool;
    optInt: Int?;
    stringField: String;
    optBool: Bool?;
    optString: String?;
}

contract MixedFieldsContract {
    mixed: MixTypes;

    init() {
        self.mixed = MixTypes{
            intField: 9,
            boolField: true,
            optInt: null,
            stringField: "abc",
            optBool: false,
            optString: null,
        };
    }
}