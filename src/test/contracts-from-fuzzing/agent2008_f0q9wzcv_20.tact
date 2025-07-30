contract OptionalDefaultsPrimitive {
    optInt: Int? = null;
    optBool: Bool? = false;
    optAddr: Address? = null;

    init() {
        self.optInt = null;
        self.optBool = false;
        self.optAddr = null;
    }
}
