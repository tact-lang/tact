contract TestContract {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = 1;
        self.optBool = null;
        self.optStr = "test";
    }
}