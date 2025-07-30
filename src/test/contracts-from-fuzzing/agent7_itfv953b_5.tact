contract ComplexFields {
    intVal: Int = 5;
    boolVal: Bool = true;
    optInt: Int?;
    optBool: Bool?;
    text: String = "test";

    init() {
        self.optInt = null;
        self.optBool = false;
    }
}