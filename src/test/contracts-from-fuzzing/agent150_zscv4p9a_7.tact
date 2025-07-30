contract MixedTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.strVal = "x";
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}