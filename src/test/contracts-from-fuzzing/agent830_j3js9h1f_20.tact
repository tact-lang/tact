contract TestContract {
    // Explicitly assigning many persistent primitive variables
    intField: Int = -12345;
    boolField: Bool = true;
    stringField: String = "hello";
    optionalInt: Int? = null;
    optionalBool: Bool? = false;
    optionalString: String? = null;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.stringField = "world";
        self.optionalInt = 42;
        self.optionalBool = null;
        self.optionalString = "test";
    }
}