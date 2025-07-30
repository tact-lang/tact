contract TestContract {
    intField: Int;
    boolField: Bool;
    stringField: String;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.stringField = "test";
    }

    receive() {
        self.intField = 2;
    }
}