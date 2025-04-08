struct OptionalStruct {
    flag: Bool;
}

contract OptionalField {
    optStruct: OptionalStruct?;

    init() {
        self.optStruct = OptionalStruct{ flag: false };
    }
}