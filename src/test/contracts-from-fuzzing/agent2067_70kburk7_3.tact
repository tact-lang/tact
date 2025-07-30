struct OptionalStruct {
    someField: Int?;
    anotherField: Bool?;
}

contract OptionInStruct {
    stored: OptionalStruct;

    init() {
        self.stored = OptionalStruct{
            someField: null,
            anotherField: true
        };
    }
}