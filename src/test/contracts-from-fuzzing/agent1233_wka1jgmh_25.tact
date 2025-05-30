contract MixedOptionalsDefaults {
    optInt: Int?;
    optBool: Bool?;
    defInt: Int = 1;
    defStr: String = "def";

    init() {
        self.optInt = null;
        self.optBool = true;
        self.defInt = 42;
        self.defStr = "overridden";
    }
}