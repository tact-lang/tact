contract OnlyOptional {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optStr = null;
    }

    receive() {
        self.optInt = 123;
    }
}