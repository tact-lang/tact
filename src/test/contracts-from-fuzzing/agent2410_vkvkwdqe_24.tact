contract MultiPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.intVal = 5;
        self.boolVal = true;
        self.strVal = "string";
        self.optInt = null;
        self.optBool = false;
        self.optStr = null;
    }
}