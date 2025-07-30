struct NestedOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;
}

contract OptionalAllFields {
    storage: NestedOptionals;
    init() {
        self.storage = NestedOptionals{
            optInt: null,
            optBool: null,
            optAddr: null,
            optCell: null,
            optSlice: null,
            optString: null
        };
    }
}
