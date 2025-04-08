contract OptPrimitive {
    optBool: Bool?;
    optInt: Int?;
    optAddr: Address?;
    optCell: Cell?;

    init() {
        self.optBool = null;
        self.optInt = null;
        self.optAddr = null;
        self.optCell = null;
    }
}