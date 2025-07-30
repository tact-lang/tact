contract WithDefaults {
    x: Int = 1;
    flag: Bool = false;
    s: String = "abc";
    optInt: Int? = null;
    optBool: Bool? = true;

    init() {
        self.x = 5;
        self.flag = true;
        self.s = "def";
        self.optInt = 42;
        self.optBool = null;
    }
}