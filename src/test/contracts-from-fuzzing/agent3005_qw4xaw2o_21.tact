contract OptNestedPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optSlice: Slice?;

    init() {
        self.optInt=null;
        self.optBool=null;
        self.optAddress=null;
        self.optSlice=null;
    }
}