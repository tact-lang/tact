contract LargeVariants {
    intVal: Int;
    optInt: Int?;
    boolVal: Bool;
    optBool: Bool?;
    strVal: String;
    optStr: String?;

    init() {
        self.intVal = 1;
        self.optInt = null;
        self.boolVal = true;
        self.optBool = false;
        self.strVal = "abc";
        self.optStr = null;
    }
}