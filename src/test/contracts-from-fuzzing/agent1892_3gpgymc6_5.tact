contract EdgeCaseContract {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;

    init() {
        self.intVal = -123456789;
        self.boolVal = true;
        self.stringVal = "test string";
        self.intOpt = null;
        self.boolOpt = false;
        self.stringOpt = null;
    }
}