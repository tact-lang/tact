struct OptPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;
}

contract TestOptPrimitives {
    storage: OptPrimitives;

    init() {
        self.storage = OptPrimitives{
            optInt: null,
            optBool: null,
            optAddr: null,
            optCell: null,
            optSlice: null,
            optStr: null
        };
    }
}
