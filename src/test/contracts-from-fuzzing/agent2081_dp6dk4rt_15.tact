struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract ComplexMixed {
    data: MixedTypes;
    init() {
        self.data = MixedTypes{
            intVal: 1,
            boolVal: true,
            strVal: "hi",
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}