contract AllTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.intVal = 10;
        self.boolVal = true;
        self.strVal = "hello";
        self.optInt = null;
        self.optBool = false;
        self.optStr = null;
    }
}