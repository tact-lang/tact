contract DirectOptionalFieldUse {
    optionalInt: Int?;
    optBool: Bool?;

    init() {
        self.optionalInt = null;
        self.optBool = null;
    }

    receive() {
        if (self.optionalInt != null) {
            self.optionalInt = self.optionalInt!! + 1;
        } else {
            self.optionalInt = 0;
        }

        if (self.optBool == null) {
            self.optBool = true;
        } else {
            self.optBool = !self.optBool!!;
        }
    }
}
