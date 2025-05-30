struct Blend {
    intVal: Int;
    optInt: Int?;
    strVal: String;
    optStr: String?;
    boolVal: Bool;
    optBool: Bool?;
}

contract MixedStruct {
    blended: Blend;

    init() {
        self.blended = Blend{
            intVal: 1,
            optInt: null,
            strVal: "hi",
            optStr: null,
            boolVal: true,
            optBool: null,
        };
    }
}