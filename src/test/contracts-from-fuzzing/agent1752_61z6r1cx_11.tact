contract PersistentOptionalPrimitives {
    oInt: Int?;
    oBool: Bool?;
    oStr: String?;
    oCell: Cell?;
    oSlice: Slice?;
    oAddr: Address?;

    init() {
        self.oInt = null;
        self.oBool = null;
        self.oStr = null;
        self.oCell = null;
        self.oSlice = null;
        self.oAddr = null;
    }
}