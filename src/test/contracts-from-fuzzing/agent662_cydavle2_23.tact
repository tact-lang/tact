contract ScalarDefaults {
    intField: Int = 42;
    boolField: Bool = false;
    strField: String = "def";
    init() {
        self.intField = 100;
        self.boolField = true;
        self.strField = "changed";
    }
}