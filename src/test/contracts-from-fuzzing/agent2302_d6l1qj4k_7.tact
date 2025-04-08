struct MixTypes {
    boolField: Bool;
    intField: Int;
    stringField: String;
    optBool: Bool?;
    optInt: Int?;
    optString: String?;
}

contract MixedStorage {
    data: MixTypes;

    init() {
        self.data = MixTypes{
            boolField: true,
            intField: 123,
            stringField: "abc",
            optBool: null,
            optInt: null,
            optString: null
        };
    }
}
