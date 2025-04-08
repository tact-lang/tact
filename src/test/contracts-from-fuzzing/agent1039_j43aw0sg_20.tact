contract TestContract {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = 42;
        self.optBool = null;
        self.optStr = null;
    }
}