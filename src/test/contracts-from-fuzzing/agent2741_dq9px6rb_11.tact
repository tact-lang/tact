contract MixedPrimOpt {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.strVal = "hello";
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
    }
}