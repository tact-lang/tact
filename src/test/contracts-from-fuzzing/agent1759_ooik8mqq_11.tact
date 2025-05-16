contract PrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    str: String;

    init() {
        self.intVal = 5;
        self.boolVal = true;
        self.optInt = null;
        self.optBool = false;
        self.str = "abc";
    }
}
