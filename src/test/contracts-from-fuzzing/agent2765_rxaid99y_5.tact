struct NestedStr {
    inn: Int?;
    txt: String;
    yes: Bool;
}

contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    nested: NestedStr;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.strVal = "hi";
        self.optInt = null;
        self.optBool = false;
        self.optStr = null;
        self.nested = NestedStr{inn: 5, txt: "ok", yes: false};
    }
}