contract DefaultOpt {
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.optInt = null;
        self.optBool = true;
    }

    receive() {
        self.optInt = self.optInt;
    }
}