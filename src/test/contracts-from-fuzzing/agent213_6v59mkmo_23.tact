contract X {
    rawInt: Int;
    rawBool: Bool;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.rawInt = 7;
        self.rawBool = false;
        self.optInt = null;
        self.optBool = null;
    }
}