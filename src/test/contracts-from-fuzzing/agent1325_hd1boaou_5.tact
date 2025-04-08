contract TestContract {
    boolField: Bool;
    intField: Int;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.boolField = false;
        self.intField = 10;
        self.optInt = null;
        self.optBool = null;
    }

    receive() {
        self.boolField = !self.boolField;
        self.intField += 1;
        self.optInt = self.intField;
        self.optBool = self.boolField;
    }
}