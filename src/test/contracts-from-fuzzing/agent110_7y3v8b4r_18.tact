contract OptionalAndNonOptional {
    optInt: Int?;
    normalInt: Int;
    optBool: Bool?;
    normalBool: Bool;

    init() {
        self.optInt = null;
        self.normalInt = 7;
        self.optBool = null;
        self.normalBool = true;
    }
}