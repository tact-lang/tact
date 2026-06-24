struct SeveralOptionTypes {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optString: String?;
    optCell: Cell?;
    optSlice: Slice?;
    optBuilder: Builder?;
}

contract SeveralOptionTypesContract {
    val: SeveralOptionTypes;
    init() {
        self.val = SeveralOptionTypes{
            optInt: null,
            optBool: null,
            optAddr: null,
            optString: null,
            optCell: null,
            optSlice: null,
            optBuilder: null
        };
    }
}