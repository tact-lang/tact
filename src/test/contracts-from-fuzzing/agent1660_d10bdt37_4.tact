struct OptionalStruct {
    name: String?;
    flag: Bool?;
}

contract Test4 {
    optionalField: OptionalStruct;
    init() {
        self.optionalField = OptionalStruct{ name: null, flag: true };
    }
}