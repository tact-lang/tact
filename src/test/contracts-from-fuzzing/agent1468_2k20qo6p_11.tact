contract TestPrimitiveFields {
    intField: Int = 5;
    boolField: Bool = true;
    stringField: String = "hello";

    init() {
        self.intField = 6;
        self.boolField = false;
        self.stringField = "world";
    }
}
