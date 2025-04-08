contract OptionalVsNonOptional {
    optInt: Int?;
    intVal: Int;
    optBool: Bool?;
    boolVal: Bool;
    optStr: String?;
    strVal: String;

    init() {
        self.optInt = null;
        self.intVal = 1;
        self.optBool = null;
        self.boolVal = true;
        self.optStr = null;
        self.strVal = "hi";
    }
}