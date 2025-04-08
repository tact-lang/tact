struct ManyPrim {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract ManyFieldsOpts {
    val: ManyPrim?;
    num: Int = 1;
    b: Bool = false;
    txt: String = "hi";
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.val = ManyPrim{
            intVal: 7,
            boolVal: true,
            strVal: "pp"
        };

        self.optInt = 5;
        self.optBool = true;
        self.optStr = "yo";
    }
}
