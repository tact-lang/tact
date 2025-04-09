contract OptionalFieldsDirect {
    optInt: Int?;
    optStr: String?;
    optCell: Cell?;

    init() {
        self.optInt = null;
        self.optStr = null;
        self.optCell = null;
    }
}