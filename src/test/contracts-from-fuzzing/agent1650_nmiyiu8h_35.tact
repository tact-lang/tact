struct OptionalStruct {
    number: Int?;
}

contract AssignDefaultStructOptional {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{};
    }
}