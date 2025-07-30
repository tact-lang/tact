struct StructWithOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;
}

contract OptionalsContract {
    data: StructWithOptionals;

    init() {
        self.data = StructWithOptionals{
            optInt: null,
            optBool: null,
            optAddress: null,
            optCell: null,
            optSlice: null,
            optString: null,
        };
    }
}