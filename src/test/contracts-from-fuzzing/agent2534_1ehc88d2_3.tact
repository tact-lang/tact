contract NoDefaults {
    intField: Int;
    boolField: Bool;
    stringField: String;

    init() {
        self.intField = 42;
        self.boolField = false;
        self.stringField = "hello";
    }
}