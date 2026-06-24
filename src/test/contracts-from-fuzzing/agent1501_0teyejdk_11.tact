contract OptionalDirectFields {
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optCell = null;
        self.optStr = null;
    }
}