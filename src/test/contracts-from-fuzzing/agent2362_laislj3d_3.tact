struct OptionalStruct {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract TestOptional {
    optField: OptionalStruct;
    init() {
        self.optField = OptionalStruct{
            f1: null,
            f2: true,
            f3: null
        };
    }
}