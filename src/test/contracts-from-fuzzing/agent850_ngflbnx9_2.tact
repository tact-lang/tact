contract SimplePersistence {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    str2: String;
    boolVal2: Bool;
    intVal2: Int;

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.strVal = "a";
        self.optInt = null;
        self.optBool = true;
        self.str2 = "b";
        self.boolVal2 = true;
        self.intVal2 = 42;
    }
}