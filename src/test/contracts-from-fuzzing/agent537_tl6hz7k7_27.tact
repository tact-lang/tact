contract TestContract {
    optInt: Int?;
    optBool: Bool?;
    intVal: Int;
    boolVal: Bool;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.intVal = 1;
        self.boolVal = true;
    }

    receive() {
        self.optInt = self.optInt;
        self.optBool = self.optBool;
        self.intVal = self.intVal;
        self.boolVal = self.boolVal;
    }
}
