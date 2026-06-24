contract OptionalFields {
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = "hello";
    optAddr: Address? = null;

    init() {
        self.optInt = 1;
        self.optBool = true;
        self.optStr = null;
        self.optAddr = myAddress();
    }

    receive() {
        if (self.optInt != null) {
            self.optInt = self.optInt!! + 1;
        }
    }
}