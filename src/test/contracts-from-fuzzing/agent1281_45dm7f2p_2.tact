contract MultipleOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optAddress = null;
    }
}