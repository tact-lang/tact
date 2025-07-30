contract AllDefaults {
    intVal: Int = 123;
    boolVal: Bool = false;
    strVal: String = "default";
    optInt: Int? = null;
    optBool: Bool? = null;

    init() {
        self.intVal = 456;
        self.boolVal = true;
        self.strVal = "changed";
        self.optInt = 789;
        self.optBool = false;
    }
}