struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalStorage {
    storage: OptionalStruct;

    init() {
        self.storage = OptionalStruct{};
    }
}