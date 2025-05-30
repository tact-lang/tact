struct MixTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;
}

contract MixedFields {
    fld: MixTypes;

    init() {
        self.fld = MixTypes{
            intVal: 7,
            boolVal: true,
            strVal: "yo",
            optionalInt: null,
            optionalBool: false,
            optionalString: null
        };
    }
}