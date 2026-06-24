contract TestContract {
    intField: Int = 42;
    boolField: Bool = true;
    strField: String = "abc";
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.strField = "def";
        self.optInt = 2;
        self.optBool = true;
        self.optStr = "ghi";
    }
}