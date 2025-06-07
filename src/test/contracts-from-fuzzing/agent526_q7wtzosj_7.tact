contract PrimitiveOptions {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optString: String?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.optInt = 123;
        self.optBool = null;
        self.optAddress = null;
        self.optString = "test";
        self.optCell = null;
        self.optSlice = null;
    }
}
