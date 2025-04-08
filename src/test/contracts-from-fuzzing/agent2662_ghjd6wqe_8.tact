struct OptionStruct {
    v: Int?;
}

contract OptionalInitialize {
    field: OptionStruct;

    init() {
        self.field = OptionStruct{
            v: null,
        };
    }
}