contract BoolOptionalIntMix {
    flag: Bool;
    maybeInt: Int?;
    anotherFlag: Bool;
    init() {
        self.flag = true;
        self.maybeInt = null;
        self.anotherFlag = false;
    }
}