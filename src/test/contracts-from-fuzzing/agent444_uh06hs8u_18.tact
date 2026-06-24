contract NullOptionals {
    oInt: Int?;
    oBool: Bool?;
    oAddr: Address?;

    init() {
        self.oInt = null;
        self.oBool = null;
        self.oAddr = null;
    }
}