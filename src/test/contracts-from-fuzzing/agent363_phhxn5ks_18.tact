contract Combination {
    intField: Int = 0;
    boolField: Bool = false;
    stringField: String = "";
    optInt: Int? = null;
    optBool: Bool? = null;
    optString: String? = null;

    init() {
        self.intField = 123;
        self.boolField = true;
        self.stringField = "abc";
        self.optInt = 7;
        self.optBool = false;
        self.optString = "zzz";
    }

    receive() {}
}