contract MixedTypes {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    strVal: String;
    optStr: String?;

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.optInt = null;
        self.optBool = true;
        self.strVal = "abc";
        self.optStr = null;
    }
}