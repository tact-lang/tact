contract PrimitivesPacked {
    intVal: Int = 123;
    boolVal: Bool = true;
    strVal: String = "abc";
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.strVal = "changed";
        self.optInt = null;
        self.optBool = true;
        self.optStr = null;
    }
}