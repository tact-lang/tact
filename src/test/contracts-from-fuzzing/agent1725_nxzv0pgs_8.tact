contract TestContract {
    intField: Int = 0;
    boolField: Bool = true;
    strField: String = "hello";
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;

    init() {
        self.intField = 42;
        self.optInt = 1;
        self.boolField = false;
        self.optBool = true;
        self.strField = "world";
        self.optStr = "!";
    }
}