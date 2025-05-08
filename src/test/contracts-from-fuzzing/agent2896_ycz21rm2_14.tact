contract OptionalStringAndBool {
    optStr: String?;
    optB: Bool?;

    init() {
        self.optStr = null;
        self.optB = true;
    }
}