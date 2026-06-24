contract OptionalInits {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;

    init() {
        self.optInt = 10;
        self.optBool = true;
        self.optAddr = myAddress();
    }
}