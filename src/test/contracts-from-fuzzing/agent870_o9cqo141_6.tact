struct OptionalStruct {
    intOpt: Int?;
    boolOpt: Bool?;
}

contract OptionalStructInField {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{
            intOpt: null,
            boolOpt: null
        };
    }
}