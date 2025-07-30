contract ComplexContract {
    intVal: Int = 1;
    boolVal: Bool = false;
    sVal: String = "foo";
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optStr = "bar";
    }
}