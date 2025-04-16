contract EmptyOptionalDefaults {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    receive() {
        if (self.optInt == null) {
            self.optInt = 42;
        }
        if (self.optBool == null) {
            self.optBool = true;
        }
        if (self.optStr == null) {
            self.optStr = "set";
        }
    }
}
