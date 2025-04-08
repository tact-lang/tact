struct WithOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optString: String?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract OptStorage {
    storage: WithOptionals;

    init() {
        self.storage = WithOptionals{
            optInt: null,
            optBool: null,
            optAddress: null,
            optString: null,
            optCell: null,
            optSlice: null,
        };
    }
}
