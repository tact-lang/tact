contract TestContract {
    boolField: Bool;
    intField: Int;
    optBool: Bool?;
    optInt: Int?;
    strField: String;

    init() {
        self.boolField = true;
        self.intField = 42;
        self.optBool = false;
        self.optInt = null;
        self.strField = "hello";
    }
}