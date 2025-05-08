struct Compose {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optIntField: Int?;
    optBoolField: Bool?;
    optStringField: String?;
}

contract MixedCompose {
    s: Compose;
    init() {
        self.s = Compose{
            intField: 7,
            boolField: false,
            stringField: "hello",
            optIntField: null,
            optBoolField: null,
            optStringField: null
        };
    }
}