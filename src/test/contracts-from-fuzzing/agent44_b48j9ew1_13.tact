contract AllNullable {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }

    receive() {
        self.optInt = 1;
        self.optBool = true;
        self.optStr = "s";
    }
}