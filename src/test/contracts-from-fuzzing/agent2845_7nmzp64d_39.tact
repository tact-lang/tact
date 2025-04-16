contract ContractDefaults {
    intDefault: Int = 42;
    boolDefault: Bool = false;
    stringDefault: String = "hi";
    optInt: Int? = null;
    optBool: Bool? = null;
    optString: String? = null;

    init() {
        self.intDefault = 7;
        self.boolDefault = true;
        self.stringDefault = "bye";
        self.optInt = null;
        self.optBool = true;
        self.optString = "yes";
    }
}