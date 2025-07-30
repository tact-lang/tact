contract InitDefaults {
    intVal: Int = 1;
    boolVal: Bool = true;
    strVal: String = "default";
    optionalInt: Int? = null;

    init() {
        self.intVal = 42;
        self.boolVal = false;
        self.strVal = "changed";
        self.optionalInt = null;
    }
}