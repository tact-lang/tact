struct OptionalStruct {
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalsEverywhere {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            optAddress: null,
            optCell: emptyCell(),
            optSlice: null,
            optBool: true,
            optString: null
        };
    }
}