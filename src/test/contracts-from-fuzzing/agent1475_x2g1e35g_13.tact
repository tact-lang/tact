contract MultiplePrimitives {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.intVal = 123;
        self.boolVal = true;
        self.stringVal = "Test";
        self.optInt = null;
        self.optBool = false;
        self.optString = null;
    }
}