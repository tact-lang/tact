contract BoolOptionalCombo {
    flag: Bool;
    optFlag: Bool?;

    init() {
        self.flag = true;
        self.optFlag = null;
    }
}