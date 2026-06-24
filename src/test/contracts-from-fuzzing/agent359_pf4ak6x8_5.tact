struct OptionalVals {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;
}

contract OptionalStructTest {
    val: OptionalVals;

    init() {
        self.val = OptionalVals{
            optInt: null,
            optBool: null,
            optAddress: null,
            optCell: null,
            optSlice: null,
            optString: null
        };
    }
}