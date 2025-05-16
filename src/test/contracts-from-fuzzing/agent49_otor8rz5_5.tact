contract TestContract {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optionalInt: Int?;
    optionalBool: Bool?;
    anotherString: String;
    someNum: Int = 42;
    someFlag: Bool = true;

    init() {
        self.intField = 7;
        self.boolField = false;
        self.stringField = "abc";
        self.optionalInt = null;
        self.optionalBool = null;
        self.anotherString = "xyz";
    }
}
