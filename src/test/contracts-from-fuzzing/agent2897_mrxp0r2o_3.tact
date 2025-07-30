struct OptionalNested {
    num: Int?;
    flag: Bool?;
}

contract OptionalFieldsStruct {
    nested: OptionalNested;
    init() {
        self.nested = OptionalNested{num: null, flag: true};
    }
}