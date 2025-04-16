contract ManySimpleTypesContract {
    intField: Int = 1;
    boolField: Bool = true;
    strField: String = "hello";

    init() {
        self.intField = 100;
        self.boolField = false;
        self.strField = "world";
    }
}