contract OptionalIntAndBool {
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.optInt = null;
        self.optBool = true;
    }
}