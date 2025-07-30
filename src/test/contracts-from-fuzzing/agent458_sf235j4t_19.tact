contract FieldOrderIntBoolStr {
    intVal: Int = 5;
    boolVal: Bool = true;
    strVal: String = "abc";

    init() {
        self.intVal = 10;
        self.boolVal = false;
        self.strVal = "xyz";
    }
}