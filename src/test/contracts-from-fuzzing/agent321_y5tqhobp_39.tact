struct OptionalStruct {
    first: Int?;
    second: Bool?;
}

contract TestDefaultsOptional {
    s: OptionalStruct;
    init() {
        self.s = OptionalStruct{ first: null, second: null };
    }
}