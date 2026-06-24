struct BigOptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract LargeOptional {
    optionals: BigOptionalStruct;
    init() {
        self.optionals = BigOptionalStruct {
            optInt: null, optBool: null, optString: null,
            optAddress: null, optCell: null, optSlice: null
        };
    }
}