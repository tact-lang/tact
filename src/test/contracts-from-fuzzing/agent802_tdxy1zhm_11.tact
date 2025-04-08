contract ManyPrimitives {
    intField: Int = 1;
    boolField: Bool = true;
    stringField: String = "hello";
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.optInt = 42;
        self.optBool = null;
        self.optString = "world";
    }
}