struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract OptionalDefaults {
    field: OptionalStruct = OptionalStruct{
        a: null,
        b: null
    };

    init() {
        self.field = OptionalStruct{
            a: 100,
            b: true
        };
    }
}
