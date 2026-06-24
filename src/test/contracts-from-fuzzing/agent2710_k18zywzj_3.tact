contract OptionalPrimitive {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optAddr = null;
    }
}