struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract OptionalDefaults {
    field: OptionalStruct;

    init() {
        self.field = OptionalStruct{
            x: null,
            y: null,
            z: null,
        };
    }
}