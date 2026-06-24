contract SimpleOptionalFields {
    optInt: Int? = null;
    optBool: Bool? = null;
    optAddr: Address? = null;
    optCell: Cell? = null;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optCell = null;
    }
}