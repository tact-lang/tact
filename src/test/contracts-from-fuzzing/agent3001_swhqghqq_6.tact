struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optSlice: Slice?;
    optString: String?;
}

contract OptStructContract {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            optInt: null,
            optBool: null,
            optAddr: null,
            optSlice: null,
            optString: null
        };
    }
}
