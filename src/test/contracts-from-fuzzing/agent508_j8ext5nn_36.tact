contract NullableDefault {
    optAddr: Address? = null;
    optStr: String? = null;

    init() {
        self.optAddr = null;
        self.optStr = null;
    }
}