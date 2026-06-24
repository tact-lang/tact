contract PrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "hey";
        self.optInt = null;
        self.optBool = null;
    }
}