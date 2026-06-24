contract NullOptAssign {
    optInt: Int?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optStr = null;
    }
}