contract TestContract {
    flag: Bool = true;
    optBool: Bool? = null;
    intVal: Int;
    optInt: Int?;

    init() {
        self.intVal = 8;
        self.optInt = null;
    }
}