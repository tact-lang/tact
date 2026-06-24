struct S {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract FieldStructInit {
    s: S = S{
        intVal: 1,
        boolVal: true,
        strVal: "s",
        optInt: null,
        optBool: null,
        optStr: null
    };

    init() {
        self.s = S{intVal:2, boolVal:false, strVal:"x", optInt:null, optBool:null, optStr:null};
    }
}
