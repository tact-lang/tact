contract OptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optAddr = null;
        self.optString = "hello";
    }
}