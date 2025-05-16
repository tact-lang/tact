struct OptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optBuilder: Builder?;
    optSlice: Slice?;
    optString: String?;
}

contract OptionalFieldsTest {
    opts: OptionalPrimitives;

    init() {
        self.opts = OptionalPrimitives{
            optInt: null,
            optBool: null,
            optAddr: null,
            optCell: null,
            optBuilder: null,
            optSlice: null,
            optString: null
        };
    }
}