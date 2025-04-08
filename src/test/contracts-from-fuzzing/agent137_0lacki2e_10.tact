struct OptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optSlice: Slice?;
    optCell: Cell?;
    optAddr: Address?;
}

contract TestOptionalPrimitives {
    s: OptionalPrimitives;
    init() {
        self.s = OptionalPrimitives{
            optInt:null, optBool:null, optStr:null, optSlice:null, optCell:null, optAddr:null
        };
    }
}