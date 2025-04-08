contract PrimitiveDefaults {
    intField: Int = 0;
    boolField: Bool = false;
    stringField: String = "";
    intOptField: Int?; // default null
    boolOptField: Bool?; // default null

    init() {
        self.intField = 123;
        self.boolField = true;
        self.stringField = "hi";
        self.intOptField = null;
        self.boolOptField = null;
    }
}