contract OptionalDirect {
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;
    
    init() {
        self.optInt = 999;
        self.optBool = true;
        self.optStr = "world";
    }
}