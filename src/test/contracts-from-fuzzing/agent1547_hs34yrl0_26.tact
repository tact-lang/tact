struct MixTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract MixTypesContract {
    d: MixTypes;

    init() {
        self.d = MixTypes{
            intVal: 77,
            boolVal: false,
            strVal: "mixed",
            optInt: null,
            optBool: true,
            optStr: null
        };
    }
}