contract OptionalPrimitivesSet {
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.optInt = 123;
        self.optBool = false;
    }
}