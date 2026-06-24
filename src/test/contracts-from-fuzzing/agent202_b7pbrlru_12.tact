contract OptionalPersistent {
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.optInt = null;
        self.optBool = null;
    }

    receive() {
        if (self.optInt == null) {
            self.optInt = 7;
        }
    }
}