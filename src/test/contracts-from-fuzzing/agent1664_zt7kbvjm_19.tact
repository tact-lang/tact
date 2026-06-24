contract MixedOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddr: Address?;

    init() {
        self.optInt = 100;
        self.optBool = null;
        self.optString = "hi";
        self.optAddr = null;
    }
}