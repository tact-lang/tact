contract OptionalContract {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    filledInt: Int = 7;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optStr = null;
    }
}
