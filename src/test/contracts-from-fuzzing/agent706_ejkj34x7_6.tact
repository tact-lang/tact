struct OptStruct {
    value: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionalFields {
    nested: OptStruct;

    init() {
        self.nested = OptStruct{
            value: null,
            flag: null,
            text: null,
        };
    }
}