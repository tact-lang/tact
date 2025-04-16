contract TestContract {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    
    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.stringVal = "test";
        self.optInt = null;
        self.optBool = false;
        self.optString = null;
    }
}