contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optionalInt: Int?;
    optionalStr: String?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.stringVal = "s";
        self.optionalInt = null;
        self.optionalStr = null;
    }
}