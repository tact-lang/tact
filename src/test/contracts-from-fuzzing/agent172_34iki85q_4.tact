struct OptStruct {
    value: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionalStorage {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    nestedOpt: OptStruct;

    init() {
        // leave optionals unassigned to check for default null initializations
        self.nestedOpt = OptStruct{};
    }
}