contract FieldOrderStrBoolInt {
    strVal: String = "abc";
    boolVal: Bool = true;
    intVal: Int = 5;

    init() {
        self.strVal = "xyz";
        self.boolVal = false;
        self.intVal = 10;
    }
}