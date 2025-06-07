contract TestContract {
    intField: Int = 1;
    boolField: Bool = false;
    strField: String = "hello";

    init() {
        self.intField = 42;
        self.boolField = true;
        self.strField = "world";
    }
}