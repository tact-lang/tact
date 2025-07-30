struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract MixedFields {
    combo: Combo;

    init() {
        self.combo = Combo{
            intVal: 10,
            boolVal: true,
            strVal: "hi",
            optInt: null,
            optStr: null,
            optBool: null
        };
    }
}