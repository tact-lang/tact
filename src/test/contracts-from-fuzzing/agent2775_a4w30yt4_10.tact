struct ManyOptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optSlice: Slice?;
    optCell: Cell?;
    optAddress: Address?;
}

contract ManyOptionals {
    m: ManyOptionalPrimitives;

    init() {
        self.m = ManyOptionalPrimitives{
            optInt: null,
            optBool: null,
            optString: null,
            optSlice: null,
            optCell: null,
            optAddress: null
        };
    }
}
