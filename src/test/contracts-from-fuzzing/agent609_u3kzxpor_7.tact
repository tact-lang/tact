contract MixedTypes {
    intField: Int = 2;
    boolField: Bool = true;
    strField: String = "abc";
    optInt: Int? = null;
    optBool: Bool? = false;

    init() {
        self.intField = 100;
        self.boolField = false;
        self.strField = "xyz";
        self.optInt = 42;
        self.optBool = true;
    }
}