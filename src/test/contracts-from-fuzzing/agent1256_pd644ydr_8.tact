contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.intVal = -7;
        self.boolVal = true;
        self.stringVal = "abc";
        self.optInt = 42;
        self.optBool = null;
        self.optString = "zzz";
    }
}
