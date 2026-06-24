contract MixedFields {
    intVal: Int = 7;
    boolVal: Bool = false;
    strVal: String = "hello";
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.intVal = 999;
        self.boolVal = true;
        self.strVal = "yo";
        self.optInt = 123;
        self.optBool = null;
        self.optStr = null;
    }
}