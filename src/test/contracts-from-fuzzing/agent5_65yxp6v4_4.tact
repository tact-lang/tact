struct OptionStruct {
    a: Int?;
}

contract OptionalField {
    data: OptionStruct;
    init() {
        self.data = OptionStruct{ a: null };
    }
}