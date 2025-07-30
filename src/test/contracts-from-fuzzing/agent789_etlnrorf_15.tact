struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract OptionalFieldsDefaults {
    opt: OptionalStruct;
    init() {
        self.opt = OptionalStruct{
            x: null, y: null
        };
    }
}