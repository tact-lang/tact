struct OptionalStruct {
    a: Int = 5;
    b: Bool?;
}

contract OptDefaults {
    dat: OptionalStruct;
    init() {
        self.dat = OptionalStruct{
            b: null,
        };
    }
}