contract VariousOptionals {
    opInt: Int?;
    opBool: Bool?;
    opStr: String?;
    opAddr: Address?;
    opCell: Cell?;
    opSlice: Slice?;

    init() {
        self.opInt = null;
        self.opBool = null;
        self.opStr = null;
        self.opAddr = null;
        self.opCell = null;
        self.opSlice = null;
    }
}