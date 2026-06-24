// Testing many persistent fields with default values of various types, including optional
contract MultiDefaults {
    intA: Int = 5;
    boolB: Bool = true;
    strC: String = "a";
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;

    init() {
        self.intA = 100;
        self.boolB = false;
        self.strC = "changed";
        self.optInt = 50;
        self.optBool = true;
        self.optStr = "something";
    }

    receive() {}
}