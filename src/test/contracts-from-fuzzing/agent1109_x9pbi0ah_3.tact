struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optSlice: Slice?;
    optAddr: Address?;
}

contract OptionalsTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            optInt: null,
            optBool: null,
            optString: null,
            optSlice: null,
            optAddr: null
        };
    }
}