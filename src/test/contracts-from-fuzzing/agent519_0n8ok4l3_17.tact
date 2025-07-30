contract SomeOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;

    init() {
        self.optInt = 77;
        self.optBool = null;
        self.optAddr = null;
    }
}