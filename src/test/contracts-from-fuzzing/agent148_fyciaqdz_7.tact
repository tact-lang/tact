contract TestContract {
    intVal: Int = 123;
    boolVal: Bool = true;
    stringVal: String = "Test";
    optInt: Int? = null;
    optBool: Bool? = false;
    optString: String? = null;

    init() {
        self.intVal = 456;
        self.boolVal = false;
        self.stringVal = "Changed";
        self.optInt = 789;
        self.optBool = true;
        self.optString = "Hi";
    }
}