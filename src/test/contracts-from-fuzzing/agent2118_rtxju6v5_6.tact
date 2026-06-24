contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.strVal = "text";
        self.optInt = null;
        self.optBool = true;
        self.optStr = null;
    }
}