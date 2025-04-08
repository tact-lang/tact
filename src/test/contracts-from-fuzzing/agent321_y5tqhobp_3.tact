struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptionalStructStorage {
    data: OptionalStruct = OptionalStruct{};
    init() {}
}