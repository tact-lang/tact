struct OptionalBoolStruct {
    optBool1: Bool?;
    optBool2: Bool?;
    optBool3: Bool?;
}

contract OptionalBools {
    optStruct: OptionalBoolStruct;

    init() {
        self.optStruct = OptionalBoolStruct{
            optBool1: null,
            optBool2: null,
            optBool3: null
        };
    }
}