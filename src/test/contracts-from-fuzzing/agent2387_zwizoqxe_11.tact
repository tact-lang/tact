struct OptionalStruct {
    intOpt: Int?;
    boolOpt: Bool?;
}

contract OptionalFieldContract {
    optStruct: OptionalStruct?;
    init() {
        self.optStruct = OptionalStruct{
            intOpt: 12,
            boolOpt: null,
        };
    }
}