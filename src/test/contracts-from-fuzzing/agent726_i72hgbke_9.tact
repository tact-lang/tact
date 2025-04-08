contract ManyPrimitives {
    intField: Int = 0;
    boolField: Bool = false;
    stringField: String = "";

    constField: Int = 42;

    init() {
        self.intField = 7;
        self.boolField = true;
        self.stringField = "hello";
    }

    receive() {
        self.intField += 1;
    }
}