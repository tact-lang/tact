// contract with dozen mixed primitive fields
contract TestContract {
    intField: Int = 1;
    boolField: Bool = true;
    stringField: String = "abc";
    optInt: Int? = null;
    optStr: String? = null;
    optBool: Bool? = null;

    init() {
        self.intField = 42;
        self.boolField = false;
        self.stringField = "zzz";
        self.optInt = 10;
        self.optStr = "hello";
        self.optBool = true;
    }
}