struct Basic {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract TestMany {
    s: Basic;

    init() {
        self.s = Basic{
            intVal: 7,
            boolVal: true,
            strVal: "hi",
            optInt: null,
            optStr: null,
            optBool: null
        };
    }
}