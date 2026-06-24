contract MixedTypes {
    intVal: Int;
    optInt: Int?;
    strVal: String;
    optStr: String?;
    boolVal: Bool;
    optBool: Bool?;

    init() {
        self.intVal = 1;
        self.optInt = null;
        self.strVal = "hey";
        self.optStr = "ho";
        self.boolVal = true;
        self.optBool = false;
    }
}
