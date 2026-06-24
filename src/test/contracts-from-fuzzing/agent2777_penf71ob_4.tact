struct ComplexStruct {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optIntField: Int?;
    optBoolField: Bool?;
    optStringField: String?;
}

contract TestContract {
    field: ComplexStruct;

    init() {
        self.field = ComplexStruct{
            intField: 1,
            boolField: false,
            stringField: "hi",
            optIntField: null,
            optBoolField: true,
            optStringField: null
        };
    }
}